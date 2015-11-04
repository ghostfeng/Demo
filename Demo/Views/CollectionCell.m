//
//  CollectionCell.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/29.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self = [[[NSBundle mainBundle]loadNibNamed:@"CollectionCell" owner:self options:nil]lastObject];
//    }
//    return self;
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.backgroundColor =[UIColor whiteColor];
    self.titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.titleLabel.layer.borderWidth = 2.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
