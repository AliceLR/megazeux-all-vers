@echo off

if "%1" == "" (
	ECHO Usage: MZX.bat [version]
	EXIT /B 0
)

SET BASE=%~dp0
SET EXEC=megazeux
SET VER=%1

set PARAMS=
:pars
SHIFT
IF "%1" == "" GOTO v%VER%
set PARAMS=%PARAMS% "%1"
GOTO pars


:: Specific versions

:v2.51
set DIR=mzx251
goto DOS

:v2.51s1
set EXEC=mzxs1b
set DIR=mzxs1b
goto DOS

:v2.51s2
set EXEC=mzxs2
set DIR=mzxs2b
goto DOS

:v2.51s3
set EXEC=mzxs3
set DIR=mzxs3b
goto DOS

:v2.51s3.1
set EXEC=mzxs31
set DIR=mzxs31b
goto DOS

:v2.51s3.2
set EXEC=mzxs32
set DIR=mzxs32
goto DOS

:v2.6
set EXEC=mzx26
set DIR=mzx26
goto DOS

:v2.61
set EXEC=mzx261
set DIR=mzx261
goto DOS

:v2.62
set EXEC=mzx262
set DIR=mzx262
goto DOS

:v2.62b
set EXEC=mzx262b
set DIR=mzx262b
goto DOS

:v2.65
set EXEC=mzx265
set DIR=mzx265
goto DOS

:v2.68
set EXEC=mzx268
set DIR=mzx268
goto DOS

:v2.69
set EXEC=mzx269
set DIR=mzx269
goto DOS

:v2.69b
set EXEC=mzx269b
set DIR=mzx269b
goto DOS

:v2.69c
set EXEC=mzx269c
set DIR=mzx269c
goto DOS

:v2.70
set EXEC=mzx270
set DIR=mzx270
goto DOS

:v2.80
set EXEC=mzx280
set DIR=mzx280
goto WIN

:v2.80b
set EXEC=mzx280b
set DIR=mzx280b
goto WIN

:v2.80c
set EXEC=mzx280c
set DIR=mzx280c
goto WIN

:v2.80d
set EXEC=mzx280d
set DIR=mzx280d
goto WIN

:v2.80e
set EXEC=mzx280e
set DIR=mzx280e
goto WIN

:v2.80f
set EXEC=mzx280f
set DIR=mzx280f
goto WIN

:v2.80g
set EXEC=mzx280g
set DIR=mzx280g
goto WIN

:v2.80h
set EXEC=mzx280h
set DIR=mzx280h
goto WIN

:v2.81
set EXEC=mzx281
set DIR=mzx281
goto WIN

:v2.81b
set EXEC=mzx281b
set DIR=mzx281b
goto WIN

:v2.81c
set EXEC=mzx281c
set DIR=mzx281c
goto WIN

:v2.81d
set EXEC=mzx281d
set DIR=mzx281d
goto WIN

:v2.81e
set EXEC=mzx281e
set DIR=mzx281e
goto WIN

:v2.81f
set EXEC=mzx281f
set DIR=mzx281f
goto WIN

:v2.81g
set EXEC=mzx281g
set DIR=mzx281g
goto WIN

:v2.81h
set EXEC=mzx281h
set DIR=mzx281h-x86
goto WIN

:v2.82
set EXEC=mzx282
set DIR=mzx282-x86
goto WIN

:v2.82b
set DIR=mzx282b-x86
goto WIN

:v2.83
set DIR=mzx283-x64
goto WIN

:v2.84
set DIR=mzx284-x64
goto WIN

:v2.84b
set DIR=mzx284b-x64
goto WIN

:v2.84c
set DIR=mzx284c-x64
goto WIN

:v2.90
set DIR=mzx290-x64
goto WIN

:v2.90b
set DIR=mzx290b-x64
goto WIN

:v2.90c
set DIR=mzx290c-x64
goto WIN

:v2.90d
set DIR=mzx290d-x64
goto WIN

:v2.91
set DIR=mzx291-x64
goto WIN

:v2.91b
set DIR=mzx291b-x64
goto WIN

:v2.91c
set DIR=mzx291c-x64
goto WIN


:: Execute MZX

:DOS
"%BASE%\dosbox\DOSBox.exe" -noconsole -c "cycles 30000" -c "mount C: \"%BASE%\%DIR%\"" -c C: -c %EXEC% -c exit
IF EXIST stderr.txt (
	del stderr.txt
	del stdout.txt
)
EXIT /B 0

:WIN
pushd "%BASE%\%DIR%"
"%BASE%\%DIR%\%EXEC%" %PARAMS%
popd
EXIT /B 0
