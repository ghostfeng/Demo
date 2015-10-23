//
//  NSString+Category.m
//  ModelOne
//
//  Created by LiuYongfeng on 15/10/22.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)

/**
 *  @brief  字符串MD5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)MD5String {
    const char *str = [self UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (uint32_t)strlen(str), r);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
}

@end
