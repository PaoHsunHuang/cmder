Those feature is not from the feature request. It is the feature I want to implement
by myself. There is help comment from my library and it show how to call the function
and what is each function doing. Every function could be call by lib_allen functionName
except **myls** and **random**, those 2 function require **lib_allen make** beofre use it.



|==============================================
|lib_allen -- simple library build by allen
|==============================================
|usage:
|lib_allen re
|
|description:
|restart shell
|==============================================
|usage:
lib_allen myls [-t -d -f]
|
|description:
|list all file in current directory
|-t, only .txt file
|-d, only directory, not any kind of other file
|-f str, match the argument with file name
|only output the file that match name
|==============================================
|usage:
|lib_allen random [int]
|
|description:
|give random number, allow uesr give new range
|default number is 100
|==============================================
|usage:
|lib_allen home
|
|description:
|output execute file repository
|==============================================
|usage:
|lib_allen make
|
|description:
|make .exe file for myls and random function
==============================================