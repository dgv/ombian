#!/bin/bash

dconf dump / > dconf.backup
sed -i 's/^recent-connections=.*$//g' dconf.backup
