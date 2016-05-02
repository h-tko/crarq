#!/bin/sh

FILE_DIR=$(cd $(dirname $0); pwd)
BATCH_NAME="batch.promoted_enquete"


cd $FILE_DIR

mix $BATCH_NAME
