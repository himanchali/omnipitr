#!/bin/bash

#The script will update recovery-till-timestamp value in the config file used by omnipitr-restore.
#It accepts two arguments
#$1 = Absolute Path of the config file
#$2 = The New Timetsamp (Format : 2013-03-12 22:00:00 )
#Example : ./recovery-till-timestamp-update.sh  /data_dir/omniti-restore-config.cfg  "$(date +'%Y-%m-%d 22:00:00')"

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 argument required,conf file and timestamp , $# provided"
CONFIG_FILE="$1"
NEW_TIMESTAMP="$2"
 
 
if [ -f $CONFIG_FILE ] ; then
        sed -i "s/.*--recovery-till-timestamp[ |\=].*/--recovery-till-timestamp = $NEW_TIMESTAMP /g" $CONFIG_FILE
else
        echo "Config File $CONFIG_FILE does not exist"
fi

