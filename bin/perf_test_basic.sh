#!/bin/bash
RFILE="./results_${1}_${2}.dat"
PFILE="./postfile.txt"
header="application/x-www-form-urlencoded"
url="http://mot-api-va1t-appsrv01.localdomain/session"

die () {
    echo >&2 "$@"
    exit 1
}

# Check input arguments
if [ $# -ne 2 ]
  then
    die "Require 2 arguments (Number of tests & Concurency)"
fi

if ! [ $1 -gt -1 ]
  then
    die "Argument 1 must be greater than 0"
fi
if ! [ $2 -gt -1 ]
  then
    die "Argument 2 must be greater than 0"
fi


echo "username=tester1&password=t&newlinechar=1" > $PFILE

ab -v 0 -n $1 -c $2 -p $PFILE -g $RFILE -T $header $url
