[org 0x7c00] ;程序从0x7c00开始

mov ax, 3
int 0x10 ;将显示模式设置为文本模式

CRT_ADDR_REG equ 0x3D4
CRT_DATA_REG equ 0x3D5

CRT_CURSOR_HIGH equ 0x0E
CRT_CURSOR_LOW equ 0x0F

mov ax, 0
mov ds, ax
mov ss, ax

mov sp, 0x7c00  ;初始化堆栈

xchg bx,bx

mov ax, 0xb800
mov es, ax
mov si, message

print:
     call get_cursor
     mov di, ax
     shl di, 1

     mov bl, [si]
     cmp bl, 0
     jz print_end

     mov [es:di], bl

     inc si 
     inc ax 
     call set_cursor
     jmp print


print_end:


halt:
     jmp halt



get_cursor:
     ;获取光标位置
     push dx

     xor ax, ax
     mov dx, CRT_ADDR_REG
     mov al, CRT_CURSOR_HIGH
     out dx, al


     mov dx, CRT_DATA_REG
     in al, dx
     shl ax, 8

     mov dx, CRT_ADDR_REG
     mov al, CRT_CURSOR_LOW
     out dx, al
     mov dx, CRT_DATA_REG
     in al, dx
     pop dx
     ret
set_cursor:
     ;设置光标位置， 参数用ax传递
     push dx
     push bx

     mov bx, ax


     mov dx, CRT_ADDR_REG ;端口号0x3D4送入 dx中
     mov al, CRT_CURSOR_LOW 
     out dx, al ;向端口号0x3D4写入 数据

     mov dx, CRT_DATA_REG
     mov al, bl
     out dx, al ;向端口号0x3D5写入数据

     mov dx, CRT_ADDR_REG ;端口号0x3D4送入 dx中
     mov al, CRT_CURSOR_HIGH
     out dx, al ;向端口号0x3D4写入 数据

     mov dx, CRT_DATA_REG
     mov al, bh
     out dx, al ;向端口号0x3D5写入数据

     pop bx
     pop dx 
     ret
    
message:
    db 'Hello,world', 0
times 510 - ($ - $$) db 0
db 0x55, 0xaa