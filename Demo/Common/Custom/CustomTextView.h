//
//  CustomTextView.h
//
//  Created by LiuYongfeng on 14/11/5.
//  Copyright (c) 2014年. All rights reserved.


//自定义TextView带有PlaceHolder

#import <UIKit/UIKit.h>

@interface CustomTextView : UITextView

//占位字符串
@property(nonatomic,copy)NSString *placeholder;

//占位字符的颜色
@property(nonatomic,copy)UIColor *placeholderColor;

//是否隐藏占位字符
@property(nonatomic,assign)BOOL hidePlaceholder;

@end
