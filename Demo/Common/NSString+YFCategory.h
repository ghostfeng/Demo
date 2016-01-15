

#import <Foundation/Foundation.h>

@interface NSString (YFCategory)

/** 字符串MD5加密 */
- (NSString *)MD5String;

/** 拼接沙盒Caches路径 */
- (NSString *)prependCaches;

/** 拼接沙盒Documents路径 */
- (NSString *)prependDocuments;

/** 拼接沙盒Library路径 */
- (NSString *)prependLibrary;

/** 拼接沙盒tmp路径 */
- (NSString *)prependTmp;

/** 在指定路径下创建文件夹 */
- (BOOL)createDirectory;
@end
