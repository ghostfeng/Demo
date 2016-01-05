//
//  UIColor+YFCategory.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/5.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YFCategory)
/**
 *  @brief  根据十六进制配色数值返回颜色对象
 *
 *  @param hex 十六进制配色数值
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex;

/**
 *  @brief  根据十六进制配色字符串返回颜色对象
 *
 *  @param stringToConvert 十六进制配色字符串
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/**随机色*/
+ (UIColor *)randomColor;

@end
