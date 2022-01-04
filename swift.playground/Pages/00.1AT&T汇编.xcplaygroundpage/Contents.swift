//: [Previous](@previous)

import Foundation

/*:
 
## AT&T汇编特点
- 寄存器前面加%,如 %rax
- 立即数前面带$，如 movq $3, %rax
- 读取寄存器：寄存器用()括起来，如0x1ff7(%rip)
    - ()小括号是访问寄存器内存里的值
 
## 寄存器
 
#### 16个常用寄存器
- rax/ rbx/ rcx/ rdx/ rsi/ rdi/ rbp/ rsp/
- r8/ r9/ r10/ r11/ r12/ r13/ r14/ r15
 
#### 寄存器用途
- 函数返回值
 - rax/rdx
- 函数参数存放
 - rdi/rsi/rdx/rcx/r8/r9
- 堆栈
 - rbp/rsp
- rip 作为指令指针
    - 存储着cpu下一条要执行的指令地址
    - 一旦cpu读取一条指令（读取肯定再运行前），rip会自动指向下一条指令（存储下一条指令的地址）
 
## 常见指令(汇编中是指令加操作数长度 如 movq)
- lea 取出内容赋值
    - `leaq rax, rbx` 取出rax内存地址所指向的内容赋值给rbx
    - mov是去找房间里的人，lea是去找房间号
    - lea是“load effective address”的缩写
- mov 直接给寄存器赋值
    -  `movq $0xa, 0x1ff7(%rip)` 立即数10赋值给全局变量 rip+0x1ff7 的那一块内存
        - ()小括号是访问寄存器内存里的值
- call 调用
    - 直接调用              `call 0x100001af0`
    - 间接调用（去寄存器取值） `call *rax / *rdx`；
        - ps:间接调用寄存器前面有*
- jump 跳转
- xor 异或
 
## 操作数长度
    b = byte(8bit)
    s = short(16bit integer,32bit float point)
    w = word(16bit)
    l = long(32bit integer,64bit float point)
    q = quad(64bit)
    t = ten byte(80bit float point)
 
## 简单例子：
    立即数给内存赋值        movq $0xa, 0x1ff7(%rip)
    内存地址给寄存器赋值     leaq -0x18(%rbp),%rax
    跳转:                 jmp *(rdx) / jmp 0x4001002 / jmp *(%rax)
    调用:                 call ... ret

## AT&T规律:

#### 内存分布顺序(从上到下)
 - 代码段
 - 数据段 (全局变量)
 - 堆
 - 栈
 
#### 内存地址判断区间：
- 代码段                 0x100002320  1四个0很小
- 数据段 (全局变量)        0x10000bad0     1四个0较大
- 堆                    0x102908550  1不是四个0
- 栈                    0x7ffeefbff408    很大
 
#### 寄存器判断内存地址
 - 全局变量，全局区，数据段：  0x4bc(%rip)
 - 栈空间：                -0x78(%rbp)
 - 堆空间：                - 0x10(%rax)
 */

//: [Next](@next)
