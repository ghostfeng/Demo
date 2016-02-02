//
//  FileModel.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/27.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

/**
 {
 @"url":    @"http://www.910app.cn/uploads/video/14417659573752045642929987483826015.mp4",
 @"name":   @"Wonder Girls",
 @"fileId"  :@"111"
 }
 */
#import <Foundation/Foundation.h>

@interface FileModel : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileId;

@end
