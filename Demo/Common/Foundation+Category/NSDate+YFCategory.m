//
//  NSDate+YFCategory.m
//  Demo
//
//  Created by LiuYongfeng on 16/2/2.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "NSDate+YFCategory.h"

@implementation NSDate (YFCategory)

#pragma mark - 日期格式化处理
+ (NSDate *)dateWithString:(NSString *)dateString
           formatterString:(NSString *)formatterString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatterString];
    return [formatter dateFromString:dateString];
}
@end
