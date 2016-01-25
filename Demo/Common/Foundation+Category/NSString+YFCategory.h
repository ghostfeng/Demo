

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

#pragma mark - 验证信息
/** 验证是否是手机号 */
- (BOOL)isPhoneNumber;

/** 验证是否是用户身份证号（15或18位） */
- (BOOL)isUserIdCard;

/** 验证是否是邮箱 */
- (BOOL)isEmail;
@end
