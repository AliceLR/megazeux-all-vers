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

:v1.00g
set DIR=mzx100g
goto DOS

:v1.01
set DIR=mzx101
goto DOS

:v1.02
set DIR=mzx102
goto DOS

:v1.03
set DIR=mzx103
goto DOS

:v2.02
set DIR=mzx202
goto DOS

:v2.04
set DIR=mzx204
goto DOS

:v2.07
set DIR=mzx207
goto DOS

:v2.50
set DIR=mzx250
goto DOS

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

:vsmzx
set EXEC=smzx100a
set DIR=smzx100a
goto DOS

:vak
set EXEC=mzxak
set DIR=mzxak
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

:v2.91d
set DIR=mzx291d-x64
goto WIN

:v2.91e
set DIR=mzx291e-x64
goto WIN

:v2.91f
set DIR=mzx291f-x64
goto WIN

:v2.91g
set DIR=mzx291g-x64
goto WIN

:v2.91h
set DIR=mzx291h-x64
goto WIN

:v2.91i
set DIR=mzx291i-x64
goto WIN

:v2.91j
set DIR=mzx291j-x64
goto WIN

:v2.92
set DIR=mzx292-x64
goto WIN

:v2.92b
set DIR=mzx292b-x64
goto WIN

:v2.92c
set DIR=mzx292c-x64
goto WIN

:v2.92d
set DIR=mzx292d-x64
goto WIN

:v2.92e
set DIR=mzx292e-x64
goto WIN

:v2.92f
set DIR=mzx292f-x64
goto WIN

:v2.93
set DIR=mzx293-x64
goto WIN

:v2.93b
set DIR=mzx293b-x64
goto WIN

:v2.93c
set DIR=mzx293c-x64
goto WIN

:: Execute MZX

:DOS
:: DOSBox will ignore the custom config file when running from a .bat for
:: whatever reason, so enter it manually.

:: DOSBox will also ignore the autolock setting at runtime, so .bat is stuck
:: with an annoying setting always turned on!

"%BASE%\dosbox\DOSBox.exe" ^
 "%BASE%\%DIR%\%EXEC%.exe" ^
 -c "cycles 20000" ^
 -c "autolock false" ^
 -noconsole ^
 -exit ^
 -conf "%BASE%\config\dosbox.conf"

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
