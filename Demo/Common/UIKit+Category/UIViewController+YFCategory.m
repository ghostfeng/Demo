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
    Method dealloc_system = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method dealloc_custom = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(dealloc_system, dealloc_custom);
    
    Method didReceiveMemoryWarning_system = class_getInstanceMethod([self class], NSSelectorFromString(@"didReceiveMemoryWarning"));
    Method didReceiveMemoryWarning_custom = class_getInstanceMethod([self class], @selector(didReceiveMemoryWarningSwizzle));
    method_exchangeImplementations(didReceiveMemoryWarning_system, didReceiveMemoryWarning_custom);
}

- (void)deallocSwizzle
{
    NSLog(@"%@被销毁了！！！", [self class]);
    
    [self deallocSwizzle];
}

- (void)didReceiveMemoryWarningSwizzle
{
    NSLog(@"%@内存警告！！！", [self class]);
    [self didReceiveMemoryWarningSwizzle];
}
static char MethodKey;
- (void)setMethod:(NSString *)method
{
    [self willChangeValueForKey:@"method"];
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"method"];
}

- (NSString *)method
{
    return objc_getAssociatedObject(self, &MethodKey);
}

@end
