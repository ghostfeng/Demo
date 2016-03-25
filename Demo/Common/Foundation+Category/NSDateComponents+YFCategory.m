//
//  NSDateComponents+YFCategory.m
//  Demo
//
//  Created by 刘永峰 on 16/3/25.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "NSDateComponents+YFCategory.h"


@implementation NSDateComponents (YFCategory)

- (NSComparisonResult)compare:(NSDateComponents *)components
{
    NSComparisonResult comparisonResult = NSOrderedSame;
    if (self.year==components.year&& self.month==components.month&&self.day==components.day) {
        comparisonResult = NSOrderedSame;
    }else if (self.year<=components.year&& self.month<=components.month&&self.day<components.day){
        comparisonResult = NSOrderedAscending;
    }else if (self.year>=components.year&& self.month>=components.month&&self.day>components.day){
        comparisonResult = NSOrderedDescending;
    }else{
        comparisonResult = NSOrderedSame;
    }
    return comparisonResult;
}

@end
