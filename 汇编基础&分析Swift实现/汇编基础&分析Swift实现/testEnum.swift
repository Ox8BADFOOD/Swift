//
//  testEnum.swift
//  汇编基础&分析Swift实现
//
//  Created by Max on 2021/12/29.
//

import Foundation

/*
 0x100003a16 <+22>:  movq   $0x2, 0x87af(%rip)        ;
 0x100003a21 <+33>:  movq   $0x4, 0x87ac(%rip)        ;
 0x100003a2c <+44>:  movq   $0x6, 0x87a9(%rip)        ;
 0x100003a37 <+55>:  movq   $0x8, 0x87a6(%rip)        ;
 0x100003a42 <+66>:  movb   $0x0, 0x87a7(%rip)        ;
 */

func testEnum(){
    var pwd = PassWord.number(2, 4, 6, 8)

    print(Mems.ptr(ofVal: &pwd))
    print("hello")
}


class Size{
	lazy var <#property name#>: <#type name#> = {
		<#statements#>
		return <#value#>
	}()
}
