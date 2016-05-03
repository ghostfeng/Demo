//
//  TopScrollView.m
//  wanlb
//
//  Created by 刘永峰 on 16/5/3.
//  Copyright © 2016年 Witgo. All rights reserved.
//
#import "TopScrollView.h"
#import "UIView+YFCategory.h"

static CGFloat kDistanceBetweenItem = 15;

@interface TopScrollView ()

/** 按钮选择背景视图 */
@property(nonatomic,strong)UIImageView *btnBgView;
/** 内容宽度 */
@property (nonatomic, assign) CGFloat maxWidth;
/** 当前选中的按钮 */
@property (nonatomic, strong) UIButton *selectedBtn;
/** 存储按钮的数组 */
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation TopScrollView

- (NSMutableArray *)btnArray {
    if (_btnArray == nil) {
        _btnArray = [[NSMutableArray alloc]init];
    }
    return _btnArray;
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    
    if (!self.btnBgView) {
        self.btnBgView = [[UIImageView alloc]initWithFrame:CGRectMake(kDistanceBetweenItem, (self.frame.size.height-4), 0, 2)];
        self.btnBgView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.btnBgView];
        
        self.maxWidth = kDistanceBetweenItem;
        self.backgroundColor = [UIColor whiteColor];
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.showsHorizontalScrollIndicator = NO;
        
        for (NSInteger i =0; i<dataList.count; i++) {
            [self makeItemWithTitleIndex:i];
        }
        self.contentSize = CGSizeMake(self.maxWidth, self.frame.size.height);
    }
}

/**
 *  @brief  添加相应标题的按钮
 *
 *  @param title 按钮的标题
 */
- (void)makeItemWithTitleIndex:(NSInteger)index
{
    NSString *title = _dataList[index];
    
    UIFont *textFont = [UIFont systemFontOfSize:15];
    CGFloat itemWidth = [self calculateSizeWithFont:textFont text:title].width;
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    item.frame = CGRectMake(self.maxWidth, 0, itemWidth, self.frame.size.height);
    item.titleLabel.font = textFont;
    item.tag = 2016+index;
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [item addTarget:self
             action:@selector(itemClick:)
   forControlEvents:UIControlEventTouchUpInside];
    self.maxWidth += itemWidth + kDistanceBetweenItem;
    [self.btnArray addObject:item];
    [self addSubview:item];
    if (!self.selectedBtn && index == 0) {
        item.selected = YES;
        self.selectedBtn = item;
        self.btnBgView.width = itemWidth;
    }
}

- (void)itemClick:(UIButton *)sender {
    if (self.selectedBtn != sender) {
        //设置上次选中按钮为normal
        self.selectedBtn.selected = NO;
        //设置当前点击的按钮为selected
        sender.selected = YES;
        //记录当前选中的按钮
        self.selectedBtn = sender;
        
        if (self.listItemClickBlock) {
            self.listItemClickBlock(sender.titleLabel.text,sender.tag-2016);
        }
    }
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect btnBackViewRect = self.btnBgView.frame;
        btnBackViewRect.size.width = sender.frame.size.width;
        self.btnBgView.frame = btnBackViewRect;
        self.btnBgView.left = sender.left;
    } completion:^(BOOL finished) {
        
        if (self.contentSize.width > self.frame.size.width) {
            
            __block CGPoint changePoint;
            
            if (sender.center.x + self.frame.size.width*0.5 >= self.frame.size.width && sender.center.x + self.frame.size.width*0.5 < self.contentSize.width)
            {
                changePoint = CGPointMake(sender.center.x - self.frame.size.width*0.5, 0);
            }
            else if (sender.center.x + self.frame.size.width*0.5 >= self.contentSize.width)
            {
                changePoint = CGPointMake(self.contentSize.width-self.frame.size.width, 0);
            }
            else
            {
                changePoint = CGPointMake(0, 0);
            }
            
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = changePoint;
            }];
        }
    }];
}

-(void)itemClickWithIndex:(NSInteger)index{
    UIButton *item = (UIButton *)self.btnArray[index];
    [self itemClick:item];
}

/**
 *  @brief  根据文本和字号计算区域大小
 *
 *  @param font 字号
 *  @param t ext 文本内容
 *
 *  @return 区域大小
 */
- (CGSize)calculateSizeWithFont:(UIFont *)font text:(NSString *)text{
    NSDictionary *attr = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil].size;
    return size;
}

@end
