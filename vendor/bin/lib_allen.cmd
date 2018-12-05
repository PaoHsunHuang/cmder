@echo off
setlocal


:: check what function is going to call
:: if didn't call anything print error messeage
if "%~1" == "" (
    goto :wrongSyntax
) else if "%~1" == "/?" (
    goto :help
) else if "%~1" == "/h" (
    goto :help
) else if "%~1" == "help" (
    goto :help
) else if "%~1" == "re" (
    goto :re
) else if "%~1" == "home" (
    goto :home
) else if "%~1" == "random" (
    goto :random
) else if "%~1" == "myls" (
    goto :myls
) else if "%~1" == "make" (
    goto :make
) else (
    goto :wrongSyntax
)


:: ls function include flag -a -t -d -f
:myls
if "%~2" == "" (
    myls.exe
) else if "%~2" == "-t" (
    myls.exe -f .txt
) else if "%~2" == "-d" (
    myls.exe %~2
) else if "%~2" == "-f" (
    if "%~3" == "" (
        goto :wrongSyntax
    ) else (
        myls.exe -f %~3
    )
) else (
    myls.exe
)
endlocal
exit /b

:: random function could give new range
:random
if "%~2" == "" (
    random.exe 100
) else (
    random.exe %2
)
endlocal
exit /b

:: restart cmder
:re
start cmder
exit
endlocal
exit /b

:: print file directory
:home
set current=%CMDER_ROOT%
echo %current%
endlocal
exit /b

:: output error syntax
:wrongSyntax
echo The syntax of the command is incorrect (allen).
echo.
echo use /? or help for description
echo.
endlocal
exit /b

:: make file for myls and random function
:make
g++ %CMDER_ROOT%\vendor\bin\ls.c -o %CMDER_ROOT%\vendor\bin\myls.exe
g++ %CMDER_ROOT%\vendor\bin\random.c -o %CMDER_ROOT%\vendor\bin\random.exe
endlocal
exit /b

:help
echo ^|==============================================
echo ^|lib_allen -- simple library build by allen
echo ^|==============================================
echo ^|usage:
echo ^|lib_allen re
echo ^|
echo ^|description:
echo ^|restart shell
echo ^|==============================================
echo ^|usage:
echo ^|lib_allen myls [-t -d -f]
echo ^|
echo ^|description:
echo ^|list all file in current directory
echo ^|-t, only .txt file
echo ^|-d, only directory, not any kind of other file
echo ^|-f str, match the argument with file name
echo ^|only output the file that match name
echo ^|==============================================
echo ^|usage:
echo ^|lib_allen random [int]
echo ^|
echo ^|description:
echo ^|give random number, allow uesr give new range
echo ^|default number is 100
echo ^|==============================================
echo ^|usage:
echo ^|lib_allen home
echo ^|
echo ^|description:
echo ^|output execute file repository
echo ^|==============================================
echo ^|usage:
echo ^|lib_allen make
echo ^|
echo ^|description:
echo ^|make .exe file for myls and random function
echo ^|==============================================
endlocal
exit /b
