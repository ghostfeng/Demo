//
//  BaseModel.h
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//通过字典创建Model对象
- (id)initContentWithDic:(NSDictionary *)dic;

//创建字典和对象之间的映射关系
- (NSDictionary *)dicObjectAtt:(NSDictionary *)dic;

@end
