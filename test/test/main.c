//
//  main.c
//  test
//
//  Created by Max on 2022/1/11.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // a：内存上这一段数据（0A 00 00 00），并且以int类型解析
    // &a：a的内存地址
    int a = 10;
    printf("直接打印变量：%d\n",a);
    printf("a的地址%p\n",&a);
    
    // 定义一个指针变量；
    // 把a的地址赋值到p中
    // p的类型是int *,整型的指针
    int *p = &a;
    printf("p指向的地址%p\n",p);
    // * + 指针变量名，代表取指针的内容
    printf("p指向的内容%d\n",*p);
    
    int address = &a;
    printf("address:%d\n",address);
    
    return 0;
}
