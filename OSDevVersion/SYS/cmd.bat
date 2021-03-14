@echo off
title OS CMD Prompt
echo CMD Prompt Ver 0.25.2 R2
echo OS Ver:
ver
pause
:cmd_init
echo Enter a Command
set command=

:check_input
if "%command%"=="ls" (
	dir /w
) else (
	if "%command%"=="" goto enter_command
	if "%command%"=="exit" exit
	if "%command%"=="cmd" (
		start cmd.bat
		set command=
		goto enter_command
	)
	if "%command%"=="cd" (
		cd
		set command=
		goto enter_command
	)
	if "%command%"=="gui" (
		if exist "TEST_FEATURES" (
			echo Sorry But there is no New OS Gui Features right Now
		) else (
			start OSGui.exe
		)
	) else (
		echo Invalid Command or Syntax Error
	)
)
set command=
:enter_command
set /P command="C>"
goto check_input
goto enter_command