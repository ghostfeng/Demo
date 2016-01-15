//
//  UIImage+YFCategory.h
//
//  Created by LiuYongfeng on 16/1/5.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YFCategory)

/**
 *  @brief 颜色转换图片对象
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
