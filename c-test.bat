nasm.exe -fwin64 test.asm -DWIN64
link.exe /entry:_main /subsystem:console test.obj kernel32.lib
test.exe
echo %ERRORLEVEL%
