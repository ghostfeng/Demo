//
//  DBManager.h
//  Demo
//
//  Created by LiuYongfeng on 15/10/28.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>

@interface DBManager : NSObject

@property(nonatomic,strong)FMDatabaseQueue *dbQueue;

+ (instancetype)shareDBManager;

- (BOOL)insertSearchHistoryWithKeywordId:(NSString *)keywordId keyword:(NSString *)keyword date:(NSString *)date;
@end
