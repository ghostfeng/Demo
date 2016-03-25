//
//  CalendarDayCell.h
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CalendarDayModel;

@interface CalendarDayCell : UICollectionViewCell

/** 日历 天对象 */
@property(nonatomic , strong)CalendarDayModel *model;

@end
