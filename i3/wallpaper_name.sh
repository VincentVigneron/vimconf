#!/bin/bash

basename `cat ~/.fehbg | tail -n1 | sed -e "s/^'[^(')]*'\s'[^(')]*'\s'\([^(')]*\)'.*$/\1/" | sed "s/.png$//g"` | cut -d'.' -f1
