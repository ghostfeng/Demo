//
//  CalendarLogic.m
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "CalendarLogic.h"
#import "NSDateComponents+YFCategory.h"

static CalendarLogic *calendarlogic = nil;
@implementation CalendarLogic

+ (instancetype)shareCalendarLogic
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendarlogic = [[self alloc]init];
    });
    return calendarlogic;
}

/**
 *  @brief 获取从当前日期开始到几天后总共的日历月数组
 *
 *  @param fromDate 起始日期
 *  @param days     天数
 *
 *  @return 日历月数组
 */
- (NSMutableArray *)getMonthArrayFromDate:(NSDate *)fromDate beforeAfterDays:(NSInteger)days
{
    if (!fromDate) {
        fromDate = [NSDate date];
    }
    
    NSDate *toDate = [fromDate beforeAfterDays:days];
    
    //开始日期组件
    NSDateComponents *fromDateComponents= [fromDate YMDComponents];
    //结束日期组件
    NSDateComponents *toDateComponents= [toDate YMDComponents];
    //起始日期相差几个月
    NSInteger months = (toDateComponents.year-fromDateComponents.year)*12 + toDateComponents.month-fromDateComponents.month;
    if (months < 0) {
        return nil;
    }
    //该数组中 存放每个月的calendarDayModel的数组
    NSMutableArray *calendarMonth = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i <= months; i++) {
        //分别计算每个月有多少天
        NSDate *date = [fromDate beforeAfterMonths:i];
        NSMutableArray *calendarDays = [[NSMutableArray alloc]init];
        [calendarDays addObjectsFromArray:[self calculateDaysInPreviousMonthWithDate:date]];
        [calendarDays addObjectsFromArray:[self calculateDaysInCurrentMonthWithDate:date]];
        [calendarDays addObjectsFromArray:[self calculateDaysInNextMonthWithDate:date]];
        
        [calendarMonth insertObject:calendarDays atIndex:i];
    }
    return calendarMonth;
}

/** 计算当前日期的上个月在当前月日历上要显示的天数 */
- (NSMutableArray *)calculateDaysInPreviousMonthWithDate:(NSDate *)date
{
    //获取当前月第一天是星期几
    NSUInteger firstWeekOrdinality = [[date firstDayOfCurrentMonth]weeklyOrdinality];
    
    //获取上个月的日历组件
    NSDate *previousDate = [date beforeAfterMonths:-1];
    NSDateComponents *previousDateComponents = [previousDate YMDComponents];
    
    //获取上个月有多少天
    NSUInteger previousDays = [previousDate numberOfDaysInCurrentMonth];
    
    NSMutableArray *previousCalendarDays = [[NSMutableArray alloc]init];
    for (NSInteger i = previousDays-firstWeekOrdinality+2; i <= previousDays; i++) {
        CalendarDayModel *dayModel = [CalendarDayModel calendarDayWithYear:previousDateComponents.year month:previousDateComponents.month day:i];
        dayModel.type = CalendarDayTypeEmpty;
        [previousCalendarDays addObject:dayModel];
    }
    return previousCalendarDays;
}

/** 计算当前日期的当前月日历上要显示的天数 */
- (NSMutableArray *)calculateDaysInCurrentMonthWithDate:(NSDate *)date
{
    //获取当前月有多少天
    NSUInteger currentDays = [date numberOfDaysInCurrentMonth];
    
    //获取当前月的日历组件
    NSDateComponents *currentDateComponents = [date YMDComponents];
    
    NSMutableArray *currentCalendarDays = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i <= currentDays; i++) {
        CalendarDayModel *dayModel = [CalendarDayModel calendarDayWithYear:currentDateComponents.year month:currentDateComponents.month day:i];
        dayModel.week = [[dayModel date]weekday];
        [self changeTypeWithModel:dayModel];
        [currentCalendarDays addObject:dayModel];
    }
    return currentCalendarDays;
}

/** 计算当前日期的下个月在当前月日历上要显示的天数 */
- (NSMutableArray *)calculateDaysInNextMonthWithDate:(NSDate *)date
{
    //获取当前月最后一天是星期几
    NSUInteger lastWeekOrdinality = [[date lastDayOfCurrentMonth]weeklyOrdinality];
    if (lastWeekOrdinality == 7) {
        return nil;
    }
    
    //获取下个月的日历组件
    NSDate *nextDate = [date beforeAfterMonths:1];
    NSDateComponents *nextDateComponents = [nextDate YMDComponents];

    NSMutableArray *nextCalendarDays = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i < 7-lastWeekOrdinality+1; i++) {
        CalendarDayModel *dayModel = [CalendarDayModel calendarDayWithYear:nextDateComponents.year month:nextDateComponents.month day:i];
        dayModel.type = CalendarDayTypeEmpty;
        [nextCalendarDays addObject:dayModel];
    }
    return nextCalendarDays;
}

/** 设置样式 */
- (void)changeTypeWithModel:(CalendarDayModel *)model
{
    NSDateComponents *todayDateComponents = [[NSDate date]YMDComponents];
    NSDateComponents *currentDateComponents = [[model date]YMDComponents];
    NSComparisonResult result = [todayDateComponents compare:currentDateComponents];
    switch (result) {
        case NSOrderedSame:
        case NSOrderedAscending:
        {
            if (model.week == 1 || model.week == 7) {
                model.type = CalendarDayTypeWeekend;
            }else{
                model.type = CalendarDayTypeFuture;
            }
        }
            break;
        case NSOrderedDescending:
        {
            model.type = CalendarDayTypePast;
        }
            break;
        default:
            break;
    }
}

@end
