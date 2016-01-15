

#import <Foundation/Foundation.h>

@interface NSString (YFCategory)

#pragma mark - 加密
/** 字符串MD5加密 */
- (NSString *)MD5String;

#pragma mark - 拼接沙盒路径
/** 拼接沙盒Caches路径 */
- (NSString *)prependCaches;

/** 拼接沙盒Documents路径 */
- (NSString *)prependDocuments;

/** 拼接沙盒Library路径 */
- (NSString *)prependLibrary;

/** 拼接沙盒tmp路径 */
- (NSString *)prependTmp;

#pragma mark - 文件夹的创建与删除
/** 在指定路径下创建文件夹 */
- (BOOL)createDirectory;

/** 删除指定路径下文件夹 */
- (BOOL)removeDirectory;
@end