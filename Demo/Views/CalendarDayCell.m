//
//  CalendarDayCell.m
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "CalendarDayCell.h"
#import "CalendarDayModel.h"

@interface CalendarDayCell ()

/** 农历日 */
@property (nonatomic, strong) UILabel *lunarDay;
/** 阳历日 */
@property (nonatomic, strong) UILabel *solarDay;
/** 选中时候的图片 */
@property (nonatomic, strong) UIImageView *selectImageView;

@end

@implementation CalendarDayCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
    }
    return self;
}
#pragma mark - getter/setter
- (void)setModel:(CalendarDayModel *)model
{
    _model = model;
    
    self.solarDay.text = [NSString stringWithFormat:@"%zd",model.day];
    self.lunarDay.text = @"";
    switch (model.type) {
        case CalendarDayTypeEmpty:
        {
            [self hidden_YES];
        }
            break;
        case CalendarDayTypePast:
        {
            [self hidden_NO];
            self.solarDay.textColor = [UIColor lightGrayColor];
        }
            break;
        case CalendarDayTypeFuture:
        {
            [self hidden_NO];
            self.solarDay.textColor = [UIColor blackColor];
        }
            break;
        case CalendarDayTypeWeekend:
        {
            self.solarDay.textColor = [UIColor redColor];
            [self hidden_NO];
        }
            break;
        case CalendarDayTypeClick:
        {
            self.solarDay.textColor = [UIColor whiteColor];
            [self hidden_NO];
            self.selectImageView.hidden = NO;
        }
            break;
        default:
            break;
    }
}

- (void)hidden_YES
{
    self.solarDay.hidden = YES;
    self.lunarDay.hidden = YES;
    self.selectImageView.hidden = YES;
}


- (void)hidden_NO
{
    self.solarDay.hidden = NO;
    self.lunarDay.hidden = NO;
    self.selectImageView.hidden = YES;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpSubviews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //阳历
    self.solarDay.frame = CGRectMake(0, 15, self.bounds.size.width, self.bounds.size.width-10);
    
    //农历
    self.lunarDay.frame = CGRectMake(0, self.bounds.size.height-15, self.bounds.size.width, 13);
    
    //选中图片
    self.selectImageView.frame = CGRectMake(5, 15, self.bounds.size.width-10, self.bounds.size.width-10);
}

/** 初始化子试图 */
- (void)setUpSubviews
{
//    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.layer.borderWidth = 1;
    
    //选中图片
    self.selectImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check"]];
    [self.contentView addSubview:self.selectImageView];
    
    //阳历
    self.solarDay = [[UILabel alloc]init];
    self.solarDay.textAlignment = NSTextAlignmentCenter;
    self.solarDay.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.solarDay];
    self.solarDay.text = @"20";
    
    //农历
    self.lunarDay = [[UILabel alloc]init];
    self.lunarDay.textColor = [UIColor lightGrayColor];
    self.lunarDay.font = [UIFont boldSystemFontOfSize:10];
    self.lunarDay.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lunarDay];
    self.lunarDay.text = @"廿一";
}

@end
