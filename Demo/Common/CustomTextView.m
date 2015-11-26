//
//  CustomTextView.m
//
//  Created by LiuYongfeng on 14/11/5.
//  Copyright (c) 2014年. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setting];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setting];
}

- (void)setting
{
    //注册监测文本的变化观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    
    //默认的placeholder颜色
    _placeholderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    //绘制
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    if (text.length) {
        _hidePlaceholder = NO;
    }else{
        _hidePlaceholder = YES;
    }
    //手动调用drawRect方法
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = [placeholderColor copy];

    //绘制
    [self setNeedsDisplay];
}

#pragma mark - 观察者事件

- (void)textDidChange
{
    if (self.text.length == 0) {
        _hidePlaceholder = NO;
    }else{
        _hidePlaceholder = YES;
    }
    //手动调用drawRect方法
    [self setNeedsDisplay];
}

- (void)dealloc
{
    //移除观察者
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

- (void)drawRect:(CGRect)rect
{
    if (_hidePlaceholder) {
        return;
    }else{
        //设置绘制区域
        rect.origin.x = 7;
        rect.origin.y = 7;
        
        //开始绘制
        [_placeholder drawInRect:rect withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeholderColor}];
    }
}

@end
