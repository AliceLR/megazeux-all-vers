#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: MZX.sh [version]"
	exit 0
fi

BASE="$(dirname "$0")"
EXEC="megazeux"
VER=$1
shift

PARAMS=$@
DOS=0
WIN=0


# Specific versions

case $VER in

	"2.51")
		DIR="mzx251"
		DOS=1
		;;

	"2.51s1")
		EXEC="mzxs1b"
		DIR="mzxs1b"
		DOS=1
		;;

	"2.51s2")
		EXEC="mzxs2"
		DIR="mzxs2b"
		DOS=1
		;;

	"2.51s3")
		EXEC="mzxs3"
		DIR="mzxs3b"
		DOS=1
		;;

	"2.51s3.1")
		EXEC="mzxs31"
		DIR="mzxs31b"
		DOS=1
		;;

	"2.51s3.2")
		EXEC="mzxs32"
		DIR="mzxs32"
		DOS=1
		;;

	"2.6")
		EXEC="mzx26"
		DIR="mzx26"
		DOS=1
		;;

	"2.61")
		EXEC="mzx261"
		DIR="mzx261"
		DOS=1
		;;

	"2.62")
		EXEC="mzx262"
		DIR="mzx262"
		DOS=1
		;;

	"2.62b")
		EXEC="mzx262b"
		DIR="mzx262b"
		DOS=1
		;;

	"2.65")
		EXEC="mzx265"
		DIR="mzx265"
		DOS=1
		;;

	"2.68")
		EXEC="mzx268"
		DIR="mzx268"
		DOS=1
		;;

	"2.69")
		EXEC="mzx269"
		DIR="mzx269"
		DOS=1
		;;

	"2.69b")
		EXEC="mzx269b"
		DIR="mzx269b"
		DOS=1
		;;

	"2.69c")
		EXEC="mzx269c"
		DIR="mzx269c"
		DOS=1
		;;

	"2.70")
		EXEC="mzx270"
		DIR="mzx270"
		DOS=1
		;;

	"2.80")
		EXEC="mzx280"
		DIR="mzx280"
		WIN=1
		;;

	"2.80b")
		EXEC="mzx280b"
		DIR="mzx280b"
		WIN=1
		;;

	"2.80c")
		EXEC="mzx280c"
		DIR="mzx280c"
		WIN=1
		;;

	"2.80d")
		EXEC="mzx280d"
		DIR="mzx280d"
		WIN=1
		;;

	"2.80e")
		EXEC="mzx280e"
		DIR="mzx280e"
		WIN=1
		;;

	"2.80f")
		EXEC="mzx280f"
		DIR="mzx280f"
		WIN=1
		;;

	"2.80g")
		EXEC="mzx280g"
		DIR="mzx280g"
		WIN=1
		;;

	"2.80h")
		EXEC="mzx280h"
		DIR="mzx280h"
		WIN=1
		;;

	"2.81")
		EXEC="mzx281"
		DIR="mzx281"
		WIN=1
		;;

	"2.81b")
		EXEC="mzx281b"
		DIR="mzx281b"
		WIN=1
		;;

	"2.81c")
		EXEC="mzx281c"
		DIR="mzx281c"
		WIN=1
		;;

	"2.81d")
		EXEC="mzx281d"
		DIR="mzx281d"
		WIN=1
		;;

	"2.81e")
		EXEC="mzx281e"
		DIR="mzx281e"
		WIN=1
		;;

	"2.81f")
		EXEC="mzx281f"
		DIR="mzx281f"
		WIN=1
		;;

	"2.81g")
		EXEC="mzx281g"
		DIR="mzx281g"
		WIN=1
		;;

	"2.81h")
		EXEC="mzx281h"
		DIR="mzx281h-x86"
		WIN=1
		;;

	"2.82")
		EXEC="mzx282"
		DIR="mzx282-x86"
		WIN=1
		;;

	"2.82b")
		DIR="mzx282b-x86"
		WIN=1
		;;

	"2.83")
		DIR="mzx283-x64"
		WIN=1
		;;

	"2.84")
		DIR="mzx284-x64"
		WIN=1
		;;

	"2.84b")
		DIR="mzx284b-x64"
		WIN=1
		;;

	"2.84c")
		DIR="mzx284c-x64"
		WIN=1
		;;

	"2.90")
		DIR="mzx290-x64"
		WIN=1
		;;

	"2.90b")
		DIR="mzx290b-x64"
		WIN=1
		;;

	"2.90c")
		DIR="mzx290c-x64"
		WIN=1
		;;

	"2.90d")
		DIR="mzx290d-x64"
		WIN=1
		;;

	"2.91")
		DIR="mzx291-x64"
		WIN=1
		;;

	"2.91b")
		DIR="mzx291b-x64"
		WIN=1
		;;

	"2.91c")
		DIR="mzx291c-x64"
		WIN=1
		;;
esac


# Execute MZX

if [ $DOS = 1 ]; then
	# Fix MSYS2 paths
	BASE=${BASE/#"/c"/c:}
	"$BASE/dosbox/DOSBox.exe" -noconsole -c "cycles 30000" -c "mount C: \"$BASE/$DIR\"" -c C: -c $EXEC -c exit
	if [ -f "stderr.txt" ]; then rm -f stderr.txt; fi
	if [ -f "stdout.txt" ]; then rm -f stdout.txt; fi
fi

if [ $WIN = 1 ]; then
	pushd "$BASE/$DIR" > /dev/null
	./$EXEC $PARAMS
	popd > /dev/null
fi

