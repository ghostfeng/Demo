//
//  CalendarDayModel.m
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "CalendarDayModel.h"

@implementation CalendarDayModel

+ (instancetype)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
{
    CalendarDayModel *model = [[CalendarDayModel alloc]init];
    model.year = year;
    model.month = month;
    model.day = day;
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.year = year;
    components.month = month;
    components.day = day;
    model.date = [[NSCalendar currentCalendar]dateFromComponents:components];
    return model;
}

@end
