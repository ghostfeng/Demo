//
//  UIView+Category.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

/**
 *  @brief  通过响应者链获取当前视图所在的控制器
 *
 *  @return UIViewController
 */
- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}

@end
