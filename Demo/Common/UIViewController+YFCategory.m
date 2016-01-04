//
//  UIViewController+YFCategory.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/4.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "UIViewController+YFCategory.h"
#import <objc/runtime.h>

@implementation UIViewController (YFCategory)

#pragma mark - swizzle
+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method1, method2);
}

- (void)deallocSwizzle
{
    NSLog(@"%@被销毁了", self);
    
    [self deallocSwizzle];
}
static char MethodKey;
- (void)setMethod:(NSString *)method
{
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)method
{
    return objc_getAssociatedObject(self, &MethodKey);
}

@end
