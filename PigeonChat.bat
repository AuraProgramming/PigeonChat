@echo off
color 0F

IF EXIST %USERPROFILE%\.PigeonChat goto start
md %USERPROFILE%\.PigeonChat
md %USERPROFILE%\.PigeonChat\Data

:start
	cls
	echo [1] Create Account
	echo [2] Login
	set /p choice=
	if %choice% == 1 goto createacc
	if %choice% == 2 goto loginu
	cls
	echo Invalid number
	pause >nul
	goto start
				

:createacc
	cls
	echo Create your username:
	set /p user=
	cls
	echo Create your PIN (4 numbers):
	set /p pass=
	cls
	echo Create your display name (1 word):
	set /p display=
	cls
	echo Saving.
	timeout /t 1 >nul
	cls
	echo Saving..
	timeout /t 1 >nul
	cls
	echo Saving...
	timeout /t 1 >nul
	cls
	echo set passw=%pass%>>"%USERPROFILE%\.PigeonChat\Data\%user%.bat"
	echo set usern=%user%>>"%USERPROFILE%\.PigeonChat\Data\%user%.bat"
	echo set dn=%display%>>"%USERPROFILE%\.PigeonChat\Data\%user%.bat"
	echo Saved!
	pause >nul
	goto start

:loginu
	cls
	echo Enter your username:
	set /p userlogin=
	cls
	echo Searching for your username.
	timeout /t 1 >nul
	cls
	echo Searching for your username..
	timeout /t 1 >nul
	cls
	echo Searching for your username...
	timeout /t 1 >nul
	cls
	IF EXIST "%USERPROFILE%\.PigeonChat\Data\%userlogin%.bat" goto loginp
	echo Invalid username
	pause >nul
	goto loginu

:loginp
	cls
	echo Enter your PIN:
	set /p passlogin=
	cls
	echo Logging in.
	timeout /t 1 >nul
	cls
	echo Logging in..
	timeout /t 1 >nul
	cls
	echo Logging in...
	timeout /t 1 >nul
	cls
	call "%USERPROFILE%\.PigeonChat\Data\%userlogin%.bat"
	if %passw% == %passlogin% goto msg
	echo Incorrect password
	pause >nul
	goto loginp


:msg
	cls
	title %userlogin%'s PigeonChat session
	call "%USERPROFILE%\.PigeonChat\Data\%userlogin%.bat"
	goto msgl

:msgl
	set /p message=
	echo %dn%: %message%>>%USERPROFILE%\.PigeonChat\ChatFile.txt
	goto msgl