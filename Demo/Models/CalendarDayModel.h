//
//  CalendarDayModel.h
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+YFCategory.h"

typedef NS_ENUM(NSInteger, CalendarDayType) {
    /** 不显示 */
    CalendarDayTypeEmpty,
    /** 过去的日期 */
    CalendarDayTypePast,
    /** 将来的日期 */
    CalendarDayTypeFuture,
    /** 周末 */
    CalendarDayTypeWeekend,
    /** 被点击的日期 */
    CalendarDayTypeClick
};

@interface CalendarDayModel : NSObject

/** 年 */
@property (nonatomic, assign) NSUInteger year;
/** 月 */
@property (nonatomic, assign) NSUInteger month;
/** 日 */
@property (nonatomic, assign) NSUInteger day;
/** 星期的序号 */
@property (nonatomic, assign) NSUInteger week;
/** 日期 */
@property (nonatomic, strong) NSDate *date;
/** 样式 */
@property (nonatomic, assign) CalendarDayType type;

/** 自定义初始化方法 */
+ (instancetype)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;


/** 判断是不是同一天 */
- (BOOL)isEqualTo:(CalendarDayModel *)day;
@end
