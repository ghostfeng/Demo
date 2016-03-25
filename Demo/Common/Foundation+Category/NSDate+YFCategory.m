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

#pragma mark - 日历相关
/** 当前月有几天 */
- (NSUInteger)numberOfDaysInCurrentMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}

/** 当前月有几周 */
- (NSUInteger)numberOfWeeksInCurrentMonth
{
    NSUInteger weekday = [[self firstDayOfCurrentMonth] weeklyOrdinality];
    NSUInteger days = [self numberOfDaysInCurrentMonth];
    NSUInteger weeks = 0;
    
    if (weekday > 1) {
        weeks += 1, days -= (7 - weekday + 1);
    }
    
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    
    return weeks;
}

/** 获取当前日期是星期几
 1，2， 3， 4，5， 6，7
 日，一，二，三，四，五，六*/
- (NSUInteger)weeklyOrdinality
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}
/** 获取当前日期是星期几
 1，2， 3， 4，5， 6，7
 日，一，二，三，四，五，六*/
- (NSInteger)weekday
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *componets = [calender components:NSCalendarUnitWeekday fromDate:self];
    return [componets weekday];
}

/** 计算这个月最开始的一天 */
- (NSDate *)firstDayOfCurrentMonth
{
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:self];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}

/** 计算这个月最后一天 */
- (NSDate *)lastDayOfCurrentMonth
{
    NSCalendarUnit calendarUnit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:calendarUnit fromDate:self];
    dateComponents.day = [self numberOfDaysInCurrentMonth];
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

/** 获取年月日对象 */
- (NSDateComponents *)YMDComponents
{
    return [[NSCalendar currentCalendar] components:
            NSYearCalendarUnit|
            NSMonthCalendarUnit|
            NSDayCalendarUnit|
            NSWeekdayCalendarUnit fromDate:self];
}

/** 距离当前日期前后几天的日期 */
- (NSDate *)beforeAfterDays:(NSInteger)days
{
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.day = days;
    return [[NSCalendar currentCalendar]dateByAddingComponents:components toDate:self options:0];
}

/** 距离当前日期前后几个月的日期 */
- (NSDate *)beforeAfterMonths:(NSInteger)months
{
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.month = months;
    return [[NSCalendar currentCalendar]dateByAddingComponents:components toDate:self options:0];
}

/** 距离当前日期前后几年的日期 */
- (NSDate *)beforeAfterYears:(NSInteger)years
{
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.year = years;
    return [[NSCalendar currentCalendar]dateByAddingComponents:components toDate:self options:0];
}
@end
