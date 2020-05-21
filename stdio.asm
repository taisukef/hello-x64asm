%ifdef WIN64
%include "stdio_win64.asm"
%elifdef MAC64
%include "stdio_mac64.asm"
%elifdef LINUX64
%include "stdio_linux64.asm"
%elifdef BSD64
%include "stdio_bsd64.asm"
%endif
