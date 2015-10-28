//
//  Tools.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/28.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "Tools.h"

@implementation Tools

/**
 *  @brief  date 格式化为 string
 *
 *  @param date            NSDate对象
 *  @param formatterString 要格式化的样式（如：@“MM-dd HH:mm”）
 *
 *  @return 指定样式的时间字符串
 */
+ (NSString*)stringFromDate:(NSDate*)date withFormatterString:(NSString*)formatterString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

/**
 *  @brief  string 格式化为 date
 *
 *  @param dateString      指定样式的时间字符串（10-24 11:37）
 *  @param formatterString 格式化的样式（如：@“MM-dd HH:mm”）
 *
 *  @return NSDate对象
 */
+ (NSDate *)dateFromString:(NSString *)dateString withFormatterString:(NSString*)formatterString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

@end
