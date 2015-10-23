//
//  BaseViewController.h
//  bandu
//
//  Created by LiuYongfeng on 15/6/3.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,assign)BOOL hasBackButton;//是否有返回按钮
@property(nonatomic,assign) BOOL isTapAnywhereToDismissKeyBoard;//是否点击任何地方收起键盘
/**
 *  隐藏tableView多余的cell
 *
 *  @param tableView tableView
 */
- (void)hideTableViewExtraCell:(UITableView *)tableView;

/**
 *  @brief  返回window对象
 *
 *  @return window
 */
-(UIWindow *)getCurrentWindow;

#pragma mark - 加载提示

/**
 *  @brief  显示hud加载提示
 *
 *  @param title 提示的内容
 */
- (void)showHUD:(NSString *)title;

/**
 *  @brief  隐藏加载提示
 */
- (void)hideHUD;

/**
 *  @brief  显示文本提示
 *
 *  @param message 提示内容
 *  @param delay   消失延时时间
 */
- (void)showTextMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)delay;

@end
