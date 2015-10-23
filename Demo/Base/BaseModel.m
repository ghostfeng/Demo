//
//  BaseModel.m
//

#import "BaseModel.h"

@implementation BaseModel

//通过字典创建Model对象
- (id)initContentWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self dicToObject:dic];
    }
    return self;
}

//把字典里面的值通过映射关系写入到对应的属性里面
/*
 self.name    <-   (字典里面的值) key = name
 self.sex     <-   (字典里面的值) key = sex
 self.pid     <-   (字典里面的值) key = id
 */

//把属性的名字转化成set方法类型
- (SEL)setingToSel:(NSString *)modelKey
{
    NSString *first = [[modelKey substringToIndex:1] uppercaseString]; //首字母大写
    NSString *end = [modelKey substringFromIndex:1];
    NSString *setSel = [NSString stringWithFormat:@"set%@%@:",first,end];
    return NSSelectorFromString(setSel);
}

- (void)dicToObject:(NSDictionary *)dic
{
    for (id key in dic) {
        //获取对象属性的名字
        id modelKey = [[self dicObjectAtt:dic] objectForKey:key];
        if (modelKey) {
            //根据字符串属性的名字 生成set方法
            SEL action = [self setingToSel:modelKey];
            if ([self respondsToSelector:action]) {
                //获取字典里对应的value
                id value = [dic objectForKey:key];
                [self performSelectorOnMainThread:action withObject:value waitUntilDone:[NSThread isMainThread]];
            }
        }
    }
}

//创建字典和对象之间的映射关系
- (NSDictionary *)dicObjectAtt:(NSDictionary *)dic
{
    NSMutableDictionary *attDic = [NSMutableDictionary dictionaryWithCapacity:dic.count];
    for (id key in dic) {
        //forKey:字典里面的key setObject:属性的名字
        [attDic setObject:key forKey:key];
    }
    return attDic;
}

@end
