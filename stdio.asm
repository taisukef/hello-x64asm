%ifdef WIN64
%include "stdio_win64.asm"
%elifdef MAC64
%include "stdio_mac64.asm"
%endif
