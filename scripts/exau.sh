#!/usr/bin/env bash

# Extract audio track from video files
# Usage: SRC_DIR=/path/to/videos exau.sh
# __author__: tuan t. pham

# Reference: https://gist.github.com/protrolium/e0dbd4bb0f1a396fcb55
# ffmpeg -i test.mp4 -f mp3 -ab 320000 -vn test.mp3

echo "Entering $0"

SRC_DIR=${SRC_DIR:=/tmp/workdir}
FILE_PATTERN=${FILE_PATTERN='*.mp4 *.webm *.mkv'}
DEST_DIR=${DEST_DIR:=/tmp/workdir/ogg}
FORMAT=${FORMAT:=ogg}
BIT_RATE=${BIT_RATE:=320000}
# This works for Ubuntu/Debian where the 1st user is 1000:1000
USER_ID=${USER_ID:=1000}
GROUP_ID=${GROUP_ID:=1000}
DRY_RUN=${DRY_RUN=0}

if [ ! -d $SRC_DIR ]; then
	echo "$SRC_DIR does not exists!"
	exit 1
fi

pushd $SRC_DIR >/dev/null

[ -d $DEST_DIR ] || mkdir -p $DEST_DIR

for p in $FILE_PATTERN; do
	for f in `ls $p`; do
		out_file=$(echo $f | sed -e "s/\..*$/.$FORMAT/")
		# echo "$f $out_file"
		ffmpeg -i $f -f $FORMAT -ab $BIT_RATE -vn $DEST_DIR/$out_file
	done
done

chown -R $USER_ID:$GROUP_ID $DEST_DIR

popd >/dev/null

echo "Exiting $0"
