%ifdef WIN64
%include "stdio_win64.asm"
%elifdef MAC64
%include "stdio_mac64.asm"
%elifdef CENT64
%include "stdio_cent64.asm"
%endif
