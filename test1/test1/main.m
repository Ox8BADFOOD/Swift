//
//  main.m
//  test1
//
//  Created by Max on 2022/2/10.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%@",[Person superclass]);
//        [[[Person alloc] init] test];
//        [Person test];
        Person *p = [Person new];
        p.age = 3;
        NSLog(@"指针变量p存储的内容: 以指针输出: %p；以对象输出:%@；指针变量p的内存地址: %p", p, p, &p);
        
        int num = 2;
        int* i = &num;
        // *i 取指针的内容
        NSLog(@"取指针的内容：%zd", *i);
        
        /*
         Cannot pass object with interface type 'Person' by value to variadic function; expected type from format string was 'ssize_t' (aka 'long')
         */
        //NSLog(@"取指针的内容：%zd", *p);
    }
    return 0;
}
