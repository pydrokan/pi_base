#!/bin/sh
# Adding to crontab for running at 3.15am every day
# 15 3 * * * /bin/bash -c "/path/to/this/script.sh >> /path/to/log/file.log 2>&1"



# Repository Location 
# TODO
REPOSITORY=repository_location
# Source Directory which should be saved 
# TODO
SRC=source_location
# Export Borg passphrase for use with crontab
# TODO
export BORG_PASSPHRASE='your_passphrase'

borg create -v --stats --compression lz4 \
	$REPOSITORY::$(date --iso-8601)-$$ \
	$SRC

borg prune 			\
	--list 			\
	--keep-daily	7	\
	--keep-weekly	4	\
	--keep-monthly	6	\
	$REPOSITORY


