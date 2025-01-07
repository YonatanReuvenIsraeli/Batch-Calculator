@echo off
setlocal
title Batch Calculator
echo Program Name: Batch Calculator
echo Version: 1.0.8
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
set Equation=
echo.
goto "Start"

:"Start"
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
echo [7] Open parentheses.
echo [8] Closed parentheses.
echo.
echo [9] Calculate.
echo [10] Clear.
echo.
echo [11] Close.
echo.
set Input=
set /p Input="What do you want to do? "
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
set /a Result=%Equation% > nul 2>&1
echo.
if /i "%Result%"=="" echo %Equation%= Press any key to continue.
if /i not "%Result%"=="" echo %Equation%= %Result% Press any key to continue.
set Result=
pause > nul 2>&1
set Equation=
cls
goto "Start"

:"10"
echo.
set Clear=
set /p Clear="Are you sure you want to clear your equation %Equation%=? (Yes/No) "
if /i "%Clear%"=="Yes" goto "Clear"
if /i "%Clear%"=="No" cls
if /i "%Clear%"=="No" goto "Start"
echo Invalid syntax!
goto "10"

:"Clear"
set Equation=
cls
goto "Start"

:"11"
echo.
set Close=
set /p Close="Are you sure you want to close this batch file? (Yes/No) "
if /i "%Close%"=="Yes" goto "Close"
if /i "%Close%"=="No" cls
if /i "%Close%"=="No" goto "Start"
echo Invalid syntax!
goto "11"

:"Close"
endlocal
exit
