
#import "NSString+YFCategory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YFCategory)

- (NSString *)MD5String
{
    // 得出bytes
    const char *cstring = self.UTF8String;
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cstring, (CC_LONG)strlen(cstring), bytes);
    
    // 拼接
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5String appendFormat:@"%02x", bytes[i]];
    }
    return md5String;
}

- (NSString *)prependCaches
{
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self];
}

- (NSString *)prependDocuments
{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self];
}

- (NSString *)prependLibrary
{
    return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self];
}

- (NSString *)prependTmp
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self];
}

- (BOOL)createDirectory
{
    BOOL isDirectory = NO;
    BOOL flag = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:self isDirectory:&isDirectory];
    NSError *error = nil;
    if (!isExist) {
        //不存在，创建
        flag = [fileManager createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:&error];
        return flag;
    }
    if (isDirectory) {
        return YES;
    }
    //不是文件夹，移除再创建
    flag = [fileManager removeItemAtPath:self error:&error];
    if (flag) {
        flag = [fileManager createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:&error];
        return flag;
    }
    return NO;
}

- (BOOL)removeDirectory
{
    BOOL isDirectory = NO;
    BOOL flag = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:self isDirectory:&isDirectory];
    NSError *error = nil;
    //存在且为目录就删除
    if (isDirectory&&isExist) {
        flag = [fileManager removeItemAtPath:self error:&error];
    }
    return flag;
}
@end
