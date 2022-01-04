//
//  main.swift
//  123
//
//  Created by Max on 2021/12/29.
//

import Foundation

func method(n: CLongLong) -> Int64{
  guard n != 0 else {
    return 0
  }
  guard n != 1 else {
    return 1
  }
  var returnVal:Int64 = 1

  for i in 1...n{
      
    returnVal = returnVal * CLongLong(i)
  }

  return returnVal
}

func printMethod(){
  for n in 0...10000 {
      print(method(n:CLongLong(n)))
  }
}

printMethod()


