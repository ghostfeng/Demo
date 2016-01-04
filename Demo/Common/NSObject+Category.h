//
//  NSObject+Category.h
//  Demo
//
//  Created by LiuYongfeng on 15/11/17.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)
/**
 *  @author 刘永峰, 2016-12-29
 *
 *  @brief 获取error的错误信息
 *
 *  @param error error
 *
 *  @return 错误信息
 */
- (NSString *)tipFromError:(NSError *)error;
@end
