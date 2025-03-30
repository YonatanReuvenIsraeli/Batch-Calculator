@echo off
title Batch Calculator
setlocal
echo Program Name: Batch Calculator
echo Version: 3.0.16
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
set History=Off
set Equation=
set Entry=
goto "CheckExist"

:"CheckExist"
echo.
if exist "History.txt" goto "Exist"
goto "Start"

:"Exist"
set Exist=True
echo Please temporarily rename to something else or temporarily move to another location "History.txt" in order for this batch file to proceed. "History.txt" is not a system file. "History.txt" is located in the folder you ran this batch file from. Press any key to continue when "History.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "CheckExist"

:"Start"
echo EQUATION IS RESTRICTED TO 32-BITS! MAKE SURE YOU DO NOT EXCEED 32-BITS IN ANY PART OF THE EQUATION!
echo.
echo Saving equation history: %History%
if /i not "%Equation%%Entry%"=="" echo Current equation: %Equation%%Entry%
echo.
echo [1] Enter number.
echo.
echo [2] Plus.
echo [3] Minus.
echo [4] Times.
echo [5] Divide.
echo [6] Modulus.
echo.
echo [7] Opening parentheses.
echo [8] Closing parentheses.
echo.
echo [9] Equals.
echo.
echo [10] Clear entry.
echo [11] Clear.
echo.
echo [12] Show equation history.
echo [13] Turn off saving equation history.
echo [14] Turn on saving equation history.
echo [15] Clear equation history.
echo.
echo [16] Close.
echo.
set Input=
set /p Input="What do you want to do? (1-16) "
if /i "%Input%"=="1" goto "1"
if /i "%Input%"=="2" goto "2"
if /i "%Input%"=="3" goto "3"
if /i "%Input%"=="4" goto "4"
if /i "%Input%"=="5" goto "5"
if /i "%Input%"=="6" goto "6"
if /i "%Input%"=="7" goto "7"
if /i "%Input%"=="8" goto "8"
if /i "%Input%"=="9" goto "9"
if /i "%Input%"=="10" goto "10"
if /i "%Input%"=="11" goto "11"
if /i "%Input%"=="12" goto "12"
if /i "%Input%"=="13" goto "13"
if /i "%Input%"=="14" goto "14"
if /i "%Input%"=="15" goto "15"
if /i "%Input%"=="16" goto "16"
echo Invalid syntax!
goto "Start"

:"1"
cls
echo EQUATION IS RESTRICTED TO 32-BITS! MAKE SURE YOU DO NOT EXCEED 32-BITS IN ANY PART OF THE EQUATION!
echo.
if /i not "%Number%"=="" echo Current number: %Number%
if /i not "%Number%"=="" echo.
set /p Digit="Enter each digit one at a time. No decimals. Enter "Done" when you are done entering all digits. (0-9/Done) "
if /i "%Digit%"=="Done" goto "Number"
if /i "%Digit%"=="0" goto "Digit"
if /i "%Digit%"=="1" goto "Digit"
if /i "%Digit%"=="2" goto "Digit"
if /i "%Digit%"=="3" goto "Digit"
if /i "%Digit%"=="4" goto "Digit"
if /i "%Digit%"=="5" goto "Digit"
if /i "%Digit%"=="6" goto "Digit"
if /i "%Digit%"=="7" goto "Digit"
if /i "%Digit%"=="8" goto "Digit"
if /i "%Digit%"=="9" goto "Digit"
echo Invalid syntax! Press any key to continue.
pause > nul 2>&1
goto "1"

:"Digit"
set Number=%Number%%Digit%
goto "1"

:"Number"
set Equation=%Equation%%Entry%
set Entry=%Number%
set Digit=
set Number=
cls
goto "Start"

:"2"
set Equation=%Equation%%Entry%
set Entry=+
cls
goto "Start"

:"3"
set Equation=%Equation%%Entry%
set Entry=-
cls
goto "Start"

:"4"
set Equation=%Equation%%Entry%
set Entry=*
cls
goto "Start"

:"5"
set Equation=%Equation%%Entry%
set Entry=/
cls
goto "Start"

:"6"
set Equation=%Equation%%Entry%
set Entry=%%
cls
goto "Start"

:"7"
set Equation=%Equation%%Entry%
set Entry=(
cls
goto "Start"

:"8"
set Equation=%Equation%%Entry%
set Entry=)
cls
goto "Start"

:"9"
echo.
set /a Result=%Equation%%Entry%
if "%errorlevel%"=="0" echo %Equation%%Entry%=%Result%
if not "%errorlevel%"=="0" goto "Error"
if /i "%History%"=="On" (echo %Equation%%Entry%=%Result%) >> "History.txt"
echo Press any key to continue.
set Result=
pause > nul 2>&1
set Equation=
set Entry=
cls
goto "Start"

:"Error"
ver > nul 2>&1
set Result=
set Entry=
set Equation=
echo Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"10"
if /i "%Entry%"=="" goto "NoEntry"
echo.
set ClearEntry=
set /p ClearEntry="Are you sure you want to clear your last entry of %Entry%? (Yes/No) "
if /i "%ClearEntry%"=="Yes" goto "ClearEntry"
if /i "%ClearEntry%"=="No" cls
if /i "%ClearEntry%"=="No" goto "Start"
echo Invalid syntax!
goto "10"

:"NoEntry"
echo There is no entry to clear! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"ClearEntry"
set Entry=
cls
goto "Start"

:"11"
if /i "%Equation%%Entry%"=="" goto "NoEquation"
echo.
set ClearEquation=
set /p ClearEquation="Are you sure you want to clear your equation of %Equation%%Entry%? (Yes/No) "
if /i "%ClearEquation%"=="Yes" goto "ClearEquation"
if /i "%ClearEquation%"=="No" cls
if /i "%ClearEquation%"=="No" goto "Start"
echo Invalid syntax!
goto "11"

:"NoEquation"
echo There is no equation to clear! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"ClearEquation"
set Equation=
set Entry=
cls
goto "Start"

:"12"
if exist "History.txt" echo.
if exist "History.txt" type "History.txt"
if not exist "History.txt" echo There is no history to show! Press any key to continue.
if exist "History.txt" echo Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"13"
if "%History%"=="On" goto "Off"
echo History is already off! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"Off"
set History=Off
cls
goto "Start"

:"14"
if "%History%"=="Off" goto "On"
echo History is already on! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"On"
set History=On
cls
goto "Start"

:"15"
if exist "History.txt" goto "SureClear"
echo There is no history to clear! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"SureClear"
echo.
set ClearHistory=
set /p ClearHistory="Are you sure you want to clear your equation history? (Yes/No) "
if /i "%ClearHistory%"=="Yes" goto "ClearHistory"
if /i "%ClearHistory%"=="No" goto "Start"
echo Invalid syntax!
goto "SureClear"

:"ClearHistory"
del "History.txt" /f /q > nul 2>&1
cls
goto "Start"

:"16"
echo.
set Close=
set /p Close="Are you sure you want to close this batch file? Closing this batch file will automaticly clear your equation history. (Yes/No) "
if /i "%Close%"=="Yes" goto "AutoClear"
if /i "%Close%"=="No" cls
if /i "%Close%"=="No" goto "Start"
echo Invalid syntax!
goto "16"

:"AutoClear"
del "History.txt" /f /q > nul 2>&1
if /i "%Exist%"=="True" goto "ExistDone"
endlocal
exit

:"ExistDone"
echo.
echo You can now rename or move back the file back to "History.txt". Press any key to close this batch file.
pause > nul 2>&1
endlocal
exit
