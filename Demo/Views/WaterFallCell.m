//
//  WaterFallCell.m
//  Test
//
//  Created by LiuYongfeng on 15/4/16.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "WaterFallCell.h"

@implementation WaterFallCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"WaterFallCell" owner:self options:nil]lastObject];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
