//
//  CalendarLogic.h
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarDayModel.h"

@interface CalendarLogic : NSObject

/** 当前选中的日期天对象 */
@property (nonatomic, strong) CalendarDayModel * selectDayModel;

/** 单例对象 */
+ (instancetype)shareCalendarLogic;

/**
 *  @brief 获取从当前日期开始到几天后总共的日历月数组
 *
 *  @param fromDate 起始日期
 *  @param days     天数
 *
 *  @return 日历月数组
 */
- (NSMutableArray *)getMonthArrayFromDate:(NSDate *)fromDate beforeAfterDays:(NSInteger)days;

@end
