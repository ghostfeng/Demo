//
//  UIImage+YFCategory.m
//
//  Created by LiuYongfeng on 16/1/5.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "UIImage+YFCategory.h"

@implementation UIImage (YFCategory)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
