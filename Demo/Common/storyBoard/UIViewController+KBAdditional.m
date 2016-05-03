//
//  UIViewController+KBAdditional.m
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import "UIViewController+KBAdditional.h"
#import "KBSegueSender.h"

@implementation UIViewController (KBAdditional)

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [sender isKindOfClass: [KBSegueSender class] ] )
    {
        KBSegueSender * segueSender = (KBSegueSender*)sender;
        segueSender.prepareBlock(segue);
    }
}

@end

@implementation UIView (KBAdditional)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
