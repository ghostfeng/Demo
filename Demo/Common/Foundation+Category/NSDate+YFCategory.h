//
//  NSDate+YFCategory.h
//  Demo
//
//  Created by LiuYongfeng on 16/2/2.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YFCategory)

#pragma mark - 日期格式化处理
/**
 *  将对应格式的时间字符串转化成时间对象
 *
 *  @param dateString      时间字符串
 *  @param formatterString 格式化字符串
 *
 *  @return 格式化之后的时间
 */
+ (NSDate *)dateWithString:(NSString *)dateString
           formatterString:(NSString *)formatterString;

@end
