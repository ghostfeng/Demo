//
//  YFRatingView.m
//  Demo
//
//  Created by 刘永峰 on 16/4/14.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "YFRatingView.h"

/** 满分的星星数目 */
static CGFloat starCount = 5;

@interface YFRatingView ()
{
    /** 星星高度 */
    CGFloat starHeight;
    /** 星星宽度 */
    CGFloat starWidth;
}

/** 灰色星星视图 */
@property (nonatomic, strong) UIView *grayStarView;
/** 黄色星星视图 */
@property (nonatomic, strong) UIView *yellowStarView;


@end

@implementation YFRatingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupSubViews];
}

/** 布局子视图 */
- (void)setupSubViews
{
    
    starHeight = [UIImage imageNamed:@"yellow"].size.height;
    starWidth = [UIImage imageNamed:@"yellow"].size.width;
 NSLog(@"frame = %@",NSStringFromCGRect(self.frame));
    
    //灰色星星视图
    self.grayStarView = [self startViewWithImageName:@"gray"];
    [self addSubview:self.grayStarView];
    
    //黄色星星视图
    self.yellowStarView = [self startViewWithImageName:@"yellow"];
    [self addSubview:self.yellowStarView];
    
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat w = self.grayStarView.frame.size.width;
    CGFloat h = self.grayStarView.frame.size.height;
    
    self.frame = CGRectMake(x, y, w, h);

}

- (UIView *)startViewWithImageName:(NSString *)imageName
{
    //缩放比例
    CGFloat scale = self.bounds.size.height/starHeight;
    
    UIView *starView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, starWidth*starCount, starHeight)];
    starView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    starView.transform = CGAffineTransformMakeScale(scale, scale);
    starView.frame = CGRectMake(0, 0, starView.frame.size.width, starView.frame.size.height);
    NSLog(@"frame = %@",NSStringFromCGRect(starView.frame));
    return starView;
}

- (void)setScore:(CGFloat)score
{
    _score = score;
    
    CGFloat yellow_x = self.grayStarView.frame.origin.x;
    CGFloat yellow_y = self.grayStarView.frame.origin.y;
    CGFloat yellow_w = score*self.grayStarView.frame.size.width/10.0;
    CGFloat yellow_h = self.grayStarView.frame.size.height;
    
    self.yellowStarView.frame = CGRectMake(yellow_x,yellow_y,yellow_w,yellow_h);
}

@end
