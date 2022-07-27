offset equ 0x0000
data equ 0x55aa

mov ax, 0x1000 ;立即数寻址 立即寻址
mov ds, ax ;寄存器寻址

mov ax, [offset] ;直接寻址  当前地址+编译量  ax * 0x10 + offset
mov [offset], ax ;
;寄存器间接寻址   基址bx bp  变址si di