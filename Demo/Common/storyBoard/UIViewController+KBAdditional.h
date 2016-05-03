//
//  UIViewController+KBAdditional.h
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KBAdditional)

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end

@interface UIView (KBAdditional)

- (UIViewController*)viewController ;

@end
