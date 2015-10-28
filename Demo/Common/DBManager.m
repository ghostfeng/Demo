//
//  DBManager.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/28.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "DBManager.h"

static DBManager *manager = nil;

@implementation DBManager

+ (instancetype)shareDBManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DBManager alloc]init];
    });
    return manager;
}

- (id)init {
    self = [super init];
    if (self) {
        [self createDB];
    }
    return self;
}

- (void)createDB {
    NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/demo.sqlite",NSHomeDirectory()];
    self.dbQueue = [[FMDatabaseQueue alloc]initWithPath:dbPath];
    
    [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        //创建搜索历史表
        NSString *create_search_history = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS search_history (keyword_id integer PRIMARY KEY NOT NULL, keywords text,date text)"];
        [db executeUpdate:create_search_history];
        
    }];
}

- (BOOL)insertSearchHistoryWithKeywordId:(NSString *)keywordId keyword:(NSString *)keyword date:(NSString *)date {
    __block BOOL result;
    [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        //        if (![db open]) {
        //            NSLog(@"数据库打开失败!");
        //            [db close];
        //            *rollback = YES;
        //            return ;
        //        }
        
        NSString *sql = [NSString stringWithFormat:@"insert into search_history (keyword_id, keywords,date) values (?,?,?)"];
        result = [db executeUpdate:sql,keywordId,keyword,date];
        if (!result) {
            *rollback = YES;
            NSLog(@"插入search_history表失败");
            return ;
        }
    }];
    return  result;
}

@end
