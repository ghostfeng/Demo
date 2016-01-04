//
//  NSObject+Category.m
//  Demo
//
//  Created by LiuYongfeng on 15/11/17.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

/**
 *  @author 刘永峰, 2016-12-29
 *
 *  @brief 获取error的错误信息
 *
 *  @param error error
 *
 *  @return 错误信息
 */
- (NSString *)tipFromError:(NSError *)error
{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([error.userInfo objectForKey:@"msg"]) {
            NSArray *msgArray = [[error.userInfo objectForKey:@"msg"] allValues];
            NSUInteger num = [msgArray count];
            for (int i = 0; i < num; i++) {
                NSString *msgStr = [msgArray objectAtIndex:i];
                if (i+1 < num) {
                    [tipStr appendString:[NSString stringWithFormat:@"%@\n", msgStr]];
                }else{
                    [tipStr appendString:msgStr];
                }
            }
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%zd", error.code];
            }
        }
        return tipStr;
    }
    return nil;
}

@end
