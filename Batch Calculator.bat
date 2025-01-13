@echo off
setlocal
title Batch Calculator
echo Program Name: Batch Calculator
echo Version: 2.0.9
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
set History=off
set Equation=
goto "CheckExist"

:"CheckExist"
if exist "History.txt" goto "Exist"
echo.
goto "Start"

:"Exist"
set Exist=True
echo.
echo Please temporary rename to something else or temporary move to another location "History.txt" in order for this batch file to proceed. "History.txt" is not a system file. "History.txt" is located in the folder you ran this batch file from. Press any key to continue when "History.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "CheckExist"

:"Start"
echo EQUATION IS RESTRICTED TO 32-BITS! MAKE SURE YOU DO NOT EXCEED 32-BITS IN ANY PART OF THE EQUATION!
echo.
echo Saving equation history is %History%.
echo Current equation: %Equation%=
echo.
echo [1] Enter digit(s).
echo.
echo [2] Add.
echo [3] Subtract.
echo [4] Multiply.
echo [5] Divide.
echo [6] Modulus.
echo.
echo [7] Opening parentheses.
echo [8] Closing parentheses.
echo.
echo [9] Calculate equation.
echo [10] Clear equation.
echo.
echo [11] Show equation history.
echo [12] Turn off saving equation history.
echo [13] Turn on saving equation history.
echo [14] Clear equation history.
echo.
echo [15] Close.
echo.
set Input=
set /p Input="What do you want to do? (1-15) "
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
echo Invalid syntax!
echo.
goto "Start"

:"1"
echo.
set /p Number="Enter digit(s). "
set Equation=%Equation%%Number%
set Number=
cls
goto "Start"

:"2"
set Equation=%Equation%+
cls
goto "Start"

:"3"
set Equation=%Equation%-
cls
goto "Start"

:"4"
set Equation=%Equation%*
cls
goto "Start"

:"5"
set Equation=%Equation%/
cls
goto "Start"

:"6"
set Equation=%Equation%%%%
cls
goto "Start"

:"7"
set Equation=%Equation%(
cls
goto "Start"

:"8"
set Equation=%Equation%)
cls
goto "Start"

:"9"
echo.
set /a Result=%Equation%
if "%errorlevel%"=="0" echo %Equation%=%Result%
if not "%errorlevel%"=="0" goto "Error"
if /i "%History%"=="on" (echo %Equation%=%Result%) >> "History.txt"
echo Press any key to continue.
set Result=
pause > nul 2>&1
set Equation=
cls
goto "Start"

:"Error"
echo Press any key to continue.
ver > nul 2>&1
set Result=
pause > nul 2>&1
set Equation=
cls
goto "Start"

:"10"
echo.
set ClearEquation=
set /p ClearEquation="Are you sure you want to clear your equation %Equation%=? (Yes/No) "
if /i "%ClearEquation%"=="Yes" goto "ClearEquation"
if /i "%ClearEquation%"=="No" cls
if /i "%ClearEquation%"=="No" goto "Start"
echo Invalid syntax!
goto "10"

:"ClearEquation"
set Equation=
cls
goto "Start"

:"11"
if exist "History.txt" type "History.txt"
if not exist "History.txt" echo There is no history to show!
echo.
echo Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"12"
if "%History%"=="On" goto "Off"
echo History is already off! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"Off"
set History=off
cls
goto "Start"

:"13"
if "%History%"=="off" goto "On"
echo History is already on! Press any key to continue.
pause > nul 2>&1
cls
goto "Start"

:"On"
set History=on
cls
goto "Start"

:"14"
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

:"15"
echo.
set Close=
set /p Close="Are you sure you want to close this batch file? Closing this batch file will automaticly clear your equation history. (Yes/No) "
if /i "%Close%"=="Yes" goto "AutoClear"
if /i "%Close%"=="No" cls
if /i "%Close%"=="No" goto "Start"
echo Invalid syntax!
goto "Close"

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
