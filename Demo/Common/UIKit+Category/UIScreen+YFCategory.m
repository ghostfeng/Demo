//
//  UIScreen+YFCategory.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/27.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "UIScreen+YFCategory.h"

@implementation UIScreen (YFCategory)

/** 屏幕宽度 */
+ (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

/** 屏幕高度 */
+ (CGFloat)screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

@end
