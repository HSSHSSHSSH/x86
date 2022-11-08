[org 0x7c00] ;程序从0x7c00开始

mov ax, 3
int 0x10 ;将显示模式设置为文本模式


mov ax, 0
mov ds, ax
mov ss, ax

mov sp, 0x7c00  ;初始化堆栈

PIC_M_CMD equ 0x20
PIC_M_DATA equ 0x21
PIC_S_CMD equ 0xA0
PIC_S_DATA equ 0xA1

xchg bx,bx

;将第0个扇区写到0x1000的位置


times 510 - ($ - $$) db 0
db 0x55, 0xaa