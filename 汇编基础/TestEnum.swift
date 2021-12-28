//
//  TestEnum.swift
//  汇编基础
//
//  Created by Max on 2021/12/29.
//

import Foundation

enum PassWord{
    case number(Int, Int, Int, Int)
    case gesture(String)
}

let pwd = PassWord.number(2, 4, 6, 8)


