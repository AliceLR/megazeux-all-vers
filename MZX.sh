#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: MZX.sh [version]"
	exit 0
fi

BASE="$(dirname "$0")"
EXEC="megazeux.exe"
VER=$1
shift

PARAMS=""
DOS=0
WIN=0


# Specific versions

case $VER in

	"1.00g")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx100g"
		DOS=1
		;;

	"1.01")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx101"
		DOS=1
		;;

	"1.02")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx102"
		DOS=1
		;;

	"1.03")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx103"
		DOS=1
		;;

	"2.02")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx202"
		DOS=1
		;;

	"2.04")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx204"
		DOS=1
		;;

	"2.07")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx207"
		DOS=1
		;;

	"2.50")
		EXEC="megazeux.exe"
		DIR="mzx250"
		DOS=1
		;;

	"2.51")
		EXEC="MEGAZEUX.EXE"
		DIR="mzx251"
		DOS=1
		;;

	"2.51s1")
		EXEC="MZXS1B.EXE"
		DIR="mzxs1b"
		DOS=1
		;;

	"2.51s2")
		EXEC="mzxs2.exe"
		DIR="mzxs2b"
		DOS=1
		;;

	"2.51s3")
		EXEC="mzxs3.exe"
		DIR="mzxs3b"
		DOS=1
		;;

	"2.51s3.1")
		EXEC="mzxs31.exe"
		DIR="mzxs31b"
		DOS=1
		;;

	"2.51s3.2")
		EXEC="Mzxs32.exe"
		DIR="mzxs32"
		DOS=1
		;;

	"ak")
		EXEC="MZXak.exe"
		DIR="mzxak"
		DOS=1
		;;

	"2.6")
		EXEC="MZX26.EXE"
		DIR="mzx26"
		DOS=1
		;;

	"2.61")
		EXEC="MZX261.EXE"
		DIR="mzx261"
		DOS=1
		;;

	"2.62")
		EXEC="mzx262.exe"
		DIR="mzx262"
		DOS=1
		;;

	"2.62b")
		EXEC="mzx262b.exe"
		DIR="mzx262b"
		DOS=1
		;;

	"2.65")
		EXEC="MZX265.EXE"
		DIR="mzx265"
		DOS=1
		;;

	"2.68")
		EXEC="MZX268.EXE"
		DIR="mzx268"
		DOS=1
		;;

	"2.69")
		EXEC="MZX269.EXE"
		DIR="mzx269"
		DOS=1
		;;

	"2.69b")
		EXEC="MZX269B.EXE"
		DIR="mzx269b"
		DOS=1
		;;

	"2.69c")
		EXEC="mzx269c.exe"
		DIR="mzx269c"
		DOS=1
		;;

	"2.70")
		EXEC="MZX270.EXE"
		DIR="mzx270"
		DOS=1
		;;

	"2.80")
		EXEC="mzx280.exe"
		DIR="mzx280"
		WIN=1
		;;

	"2.80b")
		EXEC="mzx280b.exe"
		DIR="mzx280b"
		WIN=1
		;;

	"2.80c")
		EXEC="mzx280c.exe"
		DIR="mzx280c"
		WIN=1
		;;

	"2.80d")
		EXEC="mzx280d.exe"
		DIR="mzx280d"
		WIN=1
		;;

	"2.80e")
		EXEC="mzx280e.exe"
		DIR="mzx280e"
		WIN=1
		;;

	"2.80f")
		EXEC="mzx280f.exe"
		DIR="mzx280f"
		WIN=1
		;;

	"2.80g")
		EXEC="mzx280g.exe"
		DIR="mzx280g"
		WIN=1
		;;

	"2.80h")
		EXEC="mzx280h.exe"
		DIR="mzx280h"
		WIN=1
		;;

	"2.81")
		EXEC="mzx281.exe"
		DIR="mzx281"
		WIN=1
		;;

	"2.81b")
		EXEC="mzx281b.exe"
		DIR="mzx281b"
		WIN=1
		;;

	"2.81c")
		EXEC="mzx281c.exe"
		DIR="mzx281c"
		WIN=1
		;;

	"2.81d")
		EXEC="mzx281d.exe"
		DIR="mzx281d"
		WIN=1
		;;

	"2.81e")
		EXEC="mzx281e.exe"
		DIR="mzx281e"
		WIN=1
		;;

	"2.81f")
		EXEC="mzx281f.exe"
		DIR="mzx281f"
		WIN=1
		;;

	"2.81g")
		EXEC="mzx281g.exe"
		DIR="mzx281g"
		WIN=1
		;;

	"2.81h")
		EXEC="mzx281h.exe"
		DIR="mzx281h-x86"
		WIN=1
		;;

	"2.82")
		EXEC="mzx282.exe"
		DIR="mzx282-x86"
		WIN=1
		;;

	"2.82b")
		DIR="mzx282b-x86"
		WIN=1
		;;

	"2.83")
		DIR="mzx283-x86"
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

	"2.91d")
		DIR="mzx291d-x64"
		WIN=1
		;;

	"2.91e")
		DIR="mzx291e-x64"
		WIN=1
		;;

	"2.91f")
		DIR="mzx291f-x64"
		WIN=1
		;;

	"2.91g")
		DIR="mzx291g-x64"
		WIN=1
		;;

	"2.91h")
		DIR="mzx291h-x64"
		WIN=1
		;;

	"2.91i")
		DIR="mzx291i-x64"
		WIN=1
		;;

	"2.91j")
		DIR="mzx291j-x64"
		WIN=1
		;;

	"2.92")
		DIR="mzx292-x64"
		WIN=1
		;;

	"2.92b")
		DIR="mzx292b-x64"
		WIN=1
		;;

	"2.92c")
		DIR="mzx292c-x64"
		WIN=1
		;;

	"2.92d")
		DIR="mzx292d-x64"
		WIN=1
		;;

	"2.92e")
		DIR="mzx292e-x64"
		WIN=1
		;;

	"2.92f")
		DIR="mzx292f-x64"
		WIN=1
		;;
esac


# Execute MZX

if [ "$DOS" = "1" ]; then

	if [ "$MSYSTEM" != "" ]; then
		# Fix MSYS2 paths
		REALBASE="$(cygpath -w "$BASE")"
		DOSBOX="$BASE/dosbox/DOSBox.exe"
		REALEXEC="$REALBASE\\$DIR\\$EXEC"
		CONF="$REALBASE\\config\\dosbox.conf"
	else
		DOSBOX="dosbox"
		REALEXEC="$BASE/$DIR/$EXEC"
		CONF="$BASE/config/dosbox.conf"
	fi

	# Also, [name] has to be first, or it won't work
	"$DOSBOX" "$REALEXEC" -noconsole -exit -conf "$CONF"

	if [ -f "stderr.txt" ]; then rm -f stderr.txt; fi
	if [ -f "stdout.txt" ]; then rm -f stdout.txt; fi
fi

if [ "$WIN" = "1" ]; then
	pushd "$BASE/$DIR" > /dev/null || exit

	if [ "$MSYSTEM" != "" ]; then
		./$EXEC "$PARAMS" "$@"
	else
		# :sob:
		wine ./"$EXEC" "$PARAMS" "$@"
	fi

	popd > /dev/null || exit
fi
