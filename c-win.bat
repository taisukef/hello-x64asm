nasm.exe -fwin64 hello.asm -DWIN64
link.exe /entry:_main /subsystem:console hello.obj kernel32.lib
hello.exe
echo %ERRORLEVEL%
