//
//  NSDateComponents+YFCategory.h
//  Demo
//
//  Created by 刘永峰 on 16/3/25.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (YFCategory)

/** 比较两个日期控件的先后顺序 */
- (NSComparisonResult)compare:(NSDateComponents *)components;

@end
