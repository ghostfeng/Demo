//
//  BaseViewController.m
//  bandu
//
//  Created by LiuYongfeng on 15/6/3.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD.h>

@interface BaseViewController ()
{
    //加载提示控件
    MBProgressHUD *_hud;
}
@end

@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    if (UIDeviceSystemVersion >= 7.0) {
        
        //有导航栏时让视图的起点坐标从导航栏下开始
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        //设置状态栏的样式
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
    
    //点击屏幕收起键盘
//    self.isTapAnywhereToDismissKeyBoard = YES;
    
    //设置导航栏的样式
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    //隐藏系统导航栏下面的阴影线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    
    //设置导航栏的背景图片
    UIImage *image = [UIImage imageNamed:@""];
    if (UIDeviceSystemVersion >= 7.0) {
        //7.0要拉伸图片
        image = [image stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    }
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏的标题字体大小和颜色
    NSDictionary *attributeDic = @{
                                   NSForegroundColorAttributeName:[UIColor blackColor],
                                   NSFontAttributeName:[UIFont systemFontOfSize:18]
                                   };
    [self.navigationController.navigationBar setTitleTextAttributes:attributeDic];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.hasBackButton = YES;
}

//- (void)setHasBackButton:(BOOL)hasBackButton {
//    _hasBackButton = hasBackButton;
//    if (hasBackButton == NO) {
//        self.navigationItem.leftBarButtonItem = nil;
//        self.navigationItem.hidesBackButton = YES;
//    }else {
//        NSInteger count = self.navigationController.viewControllers.count;
//        if (count > 1) {
//            //自定义导航返回按钮
//            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//        }
//    }
//}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 加载提示

/**
 *  @brief  显示hud加载提示
 *
 *  @param title 提示的内容
 */
- (void)showHUD:(NSString *)title
{
    if (_hud == nil) {
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    _hud.cornerRadius = 4;
    _hud.labelText = title;
    _hud.margin = 20;
    _hud.alpha = 0.5;
    _hud.color = [UIColor darkGrayColor];
    //有无灰色的遮罩视图
    _hud.dimBackground = NO;
}

/**
 *  @brief  隐藏加载提示
 */
- (void)hideHUD
{
    if (_hud) {
        [_hud removeFromSuperview];
    }
    _hud = nil;
}

/**
 *  @brief  显示文本提示
 *
 *  @param message 提示内容
 *  @param delay   消失延时时间
 */
- (void)showTextMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)delay
{
    //显示文本提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.cornerRadius = 2;
    hud.alpha = 0.8;
    hud.labelText = message;
    hud.minSize = CGSizeMake(100, 0);
    hud.margin = 10;
    hud.labelFont = [UIFont boldSystemFontOfSize:16];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

#pragma mark - 点击屏幕收起键盘
- (void)setIsTapAnywhereToDismissKeyBoard:(BOOL)isTapAnywhereToDismissKeyBoard
{
    _isTapAnywhereToDismissKeyBoard = isTapAnywhereToDismissKeyBoard;
    if (_isTapAnywhereToDismissKeyBoard) {
        //点击屏幕任意地方收起键盘
        [self setUpForDismissKeyboard];
    }
}

// 点击屏幕任意地方收起键盘
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [notificationCenter addObserverForName:UIKeyboardWillShowNotification
                                    object:nil
                                     queue:mainQuene
                                usingBlock:^(NSNotification *note){
                                    [self.view addGestureRecognizer:singleTapGR];
                                }];
    [notificationCenter addObserverForName:UIKeyboardWillHideNotification
                                    object:nil
                                     queue:mainQuene
                                usingBlock:^(NSNotification *note){
                                    [self.view removeGestureRecognizer:singleTapGR];
                                }];
}

- (void)tapAnywhereToDismissKeyboard {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

#pragma mark - customMethod

/**
 *  隐藏tableView多余的cell
 *
 *  @param tableView tableView
 */
- (void)hideTableViewExtraCell:(UITableView *)tableView {
    tableView.tableFooterView = [[UIView alloc]init];
}

/**
 *  @brief  返回window对象
 *
 *  @return window
 */
-(UIWindow *)getCurrentWindow{
    
    UIWindow *window;
    
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate respondsToSelector:@selector(window)])
        
        window = [delegate performSelector:@selector(window)];
    
    else {
        
        window = [[UIApplication sharedApplication] keyWindow];
    }
    return window;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"%@ 内存警告！！！",[self class]);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
