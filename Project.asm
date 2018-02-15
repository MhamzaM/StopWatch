SYSTEMTIME STRUCT
wYear WORD ?
wMonth WORD ?
wDayOfWeek WORD ?
wDay WORD ?
wHour WORD ?
wMinute WORD ?
wSecond WORD ?
wMilliseconds WORD ?
SYSTEMTIME ENDS

include irvine32.inc
.data
sysTime SYSTEMTIME <>

sec BYTE 0
min BYTE 0
hr BYTE 0
mil WORD 0
msg1 BYTE " : ",0
msg2 BYTE "The value you entered is: ",0
char BYTE ?

.code
main PROC





Comment;
INVOKE GetLocalTime,ADDR sysTime
xor eax,0
xor edx,0
xor ecx,0

mov ax,systime.wMilliseconds
call writedec

call calcTime

INVOKE GetLocalTime,ADDR sysTime

call crlf

mov ax,systime.wMilliseconds
call writedec
;

xor eax,eax


int 16h 


mov char,al

mov edx,OFFSET msg2
call writestring

xor eax,eax


mov al,char

call writedec




exit
main ENDP

calcTime PROC


ret
calcTime ENDP




display PROC

mov al,hr
mov edx,OFFSET msg1
call writedec
call writestring

mov al,min

call writedec
call writestring

mov al,sec
call writedec
call writestring

mov ax,mil
call writedec
call crlf


ret
display ENDP

end main