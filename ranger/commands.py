from ranger.api.commands import *

class pdfagregate(Command):
    """:bulkrename
    This command opens a list of selected files in an external editor.
    After you edit and save the file, it will generate a shell script
    which does bulk renaming according to the changes you did in the file.
    This shell script is opened in an editor for you to review.
    After you close it, it will be executed.
    """
    def execute(self):
        import os
        import sys
        import tempfile
        from ranger.container.file import File
        from ranger.ext.shell_escape import shell_escape as esc
        py3 = sys.version_info[0] >= 3

        output = self.arg(1)
        if not self.arg(1):
            output = "output.pdf"

        # Create and edit the file list
        filenames = [f.relative_path for f in self.fm.thistab.get_selection()]
        listfile = tempfile.NamedTemporaryFile(delete=False)
        listpath = listfile.name

        if py3:
            listfile.write("\n".join(filenames).encode("utf-8"))
        else:
            listfile.write("\n".join(filenames))
        listfile.close()
        self.fm.execute_file([File(listpath)], app='editor')
        listfile = open(listpath, 'r')
        # TODO check name and number consistance
        new_filenames = listfile.read().split("\n")
        listfile.close()
        os.unlink(listpath)
        listfilenames = " ".join((esc(f) for f in new_filenames))
        # if all(a == b for a, b in zip(filenames, new_filenames)):
            # self.fm.notify("No renaming to be done!")
            # return

        # TODO check output name

        # Generate script
        cmdfile = tempfile.NamedTemporaryFile()
        script_lines = []
        script_lines.append("# This file will be executed when you close the editor.\n")
        script_lines.append("# Please double-check everything, clear the file to abort.\n")
        script_lines.extend("pdfjam %s -o %s\n" % (listfilenames, esc(output)))
        script_content = "".join(script_lines)
        if py3:
            cmdfile.write(script_content.encode("utf-8"))
        else:
            cmdfile.write(script_content)
        cmdfile.flush()

        # Open the script and let the user review it, then check if the script
        # was modified by the user
        self.fm.execute_file([File(cmdfile.name)], app='editor')
        cmdfile.seek(0)
        script_was_edited = (script_content != cmdfile.read())

        # # Do the renaming
        self.fm.run(['/bin/sh', cmdfile.name], flags='w')
        cmdfile.close()
