
#import <Foundation/Foundation.h>

@interface NSObject (YFCategory)
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
