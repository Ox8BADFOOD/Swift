//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// 字符串长度 <= 0xF，字符串内容直接存放在str1变量的内存中
var str1 = "0123456789"

// 字符串长度 > 0xF，字符串内容存放在__TEXT.cstring中（常量区）
// 字符串的地址值信息存放在str2变量的后8个字节中
var str2 = "0123456789ABCDEF"


/* 小技巧 */
// 字符串的真实地址 + 0x7fffffffffffffe0 = 0x800000010000a790
// 字符串的真实地址 = 0x800000010000a790 - 0x7fffffffffffffe0
// 字符串的真实地址 = 0x10000A7B0   是"0123456789ABCDEF"的真实地址
// 得出规律：
// 字符串字符串的真实地址 = 0x000000010000a790 + 0x20

// 由于字符串长度 <= 0xF，所以字符串内容依然存放在str1变量的内存中
str1.append("ABCDE")
// 开辟堆空间
str1.append("F")

// 开辟堆空间
str2.append("G")
//: [Next](@next)
