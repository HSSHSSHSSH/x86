;asm 的数据类型
db 100 ;define byte 定义字节
dw 0xaa55 ;define word定义字

dd 0x12345678 ;define doubleword

dw 55aah ;h结尾表16进制
db 11110000b ;b结尾2进制 可加下划线 1111_0000b
db 0b00001111 ;0b开头2进制 可加下划线 0b0000_1111

db "hello world!!!!", 2, 12 ;字符串