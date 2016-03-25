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

#pragma mark - 日历相关
/** 当前月有几天 */
- (NSUInteger)numberOfDaysInCurrentMonth;

/** 当前月有几周 */
- (NSUInteger)numberOfWeeksInCurrentMonth;

/** 获取当前日期是星期几 
 1，2， 3， 4，5， 6，7
 日，一，二，三，四，五，六*/
- (NSInteger)weekday;

/** 获取当前日期是星期几
 1，2， 3， 4，5， 6，7
 日，一，二，三，四，五，六*/
- (NSUInteger)weeklyOrdinality;

/** 计算这个月最开始的一天 */
- (NSDate *)firstDayOfCurrentMonth;

/** 计算这个月最后一天 */
- (NSDate *)lastDayOfCurrentMonth;

/** 获取年月日对象 */
- (NSDateComponents *)YMDComponents;

/** 距离当前日期前后几天的日期 */
- (NSDate *)beforeAfterDays:(NSInteger)days;

/** 距离当前日期前后几个月的日期 */
- (NSDate *)beforeAfterMonths:(NSInteger)months;

/** 距离当前日期前后几年的日期 */
- (NSDate *)beforeAfterYears:(NSInteger)years;

@end
