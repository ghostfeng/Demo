//
//  UIAlertView+Category.m
//
//  Created by LiuYongfeng on 15/8/6.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "UIAlertView+YFCategory.h"
#import <objc/runtime.h>

static void* UIAlertViewKey = @"UIAlertViewKey";

@implementation UIAlertView (YFCategory)

+ (UIAlertView *)showAlertViewWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
                                          style:(UIAlertViewStyle)style
                                          title:(NSString *)title
                                        message:(NSString *)message
                              cancelButtonTitle:(NSString *)cancelButtonTitle
                              otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    alert.delegate = alert;
    alert.alertViewStyle = style;
    
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString *))) {
            [alert addButtonWithTitle:other];
            NSLog(@"%@",other);
        }
        va_end(args);
    }
    
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
    return alert;
}

- (void)setAlertViewCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock {
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

- (UIAlertViewCallBackBlock)alertViewCallBackBlock {
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.alertViewCallBackBlock) {
        self.alertViewCallBackBlock(buttonIndex,self);
    }
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}
@end
