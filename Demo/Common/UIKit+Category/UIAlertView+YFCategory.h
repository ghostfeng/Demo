//
//  UIAlertView+Category.h
//
//  Created by LiuYongfeng on 15/8/6.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewCallBackBlock) (NSInteger buttonIndex ,UIAlertView *alertView);

@interface UIAlertView (YFCategory)<UIAlertViewDelegate>

@property(nonatomic,copy)UIAlertViewCallBackBlock alertViewCallBackBlock;

+ (UIAlertView *)showAlertViewWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
                                          style:(UIAlertViewStyle)style
                                          title:(NSString *)title
                                        message:(NSString *)message
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                              otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;

@end
