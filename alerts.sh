#!/bin/bash

perl="/usr/bin/perl"
script="$HOME/Apps/GAS/gas.pl"

command="$perl $script $1 $2"

if [[ $($command) ]]; then
	echo -e "$($command)" | mail -s "GAS Alert" ramon
fi
