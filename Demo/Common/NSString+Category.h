//
//  NSString+Category.h
//  ModelOne
//
//  Created by LiuYongfeng on 15/10/22.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 *  @brief  字符串MD5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)MD5String;

/** 拼接沙盒Caches路径 */
- (NSString *)prependCaches;

/** 拼接沙盒Documents路径 */
- (NSString *)prependDocuments;

/** 拼接沙盒Library路径 */
- (NSString *)prependLibrary;

/** 拼接沙盒tmp路径 */
- (NSString *)prependTmp;
@end
