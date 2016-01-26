
#import "NSString+YFCategory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YFCategory)

- (NSString *)MD5
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

- (NSInteger)fileSize
{
    return [[[NSFileManager defaultManager] attributesOfItemAtPath:self error:nil][NSFileSize] integerValue];
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

- (BOOL)isPhoneNumber
{
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[0-9]|17[0-9]|18[0-9]|14[0-9])[0-9]{8}$";
    NSPredicate *pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isUserIdCard
{
    BOOL flag = NO;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:self];
    return flag;
}

- (BOOL)isEmail
{
    NSString * emailRegex = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
    NSPredicate *pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isWebSite
{
    NSString * webRegex = @"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$";
    NSPredicate *pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",webRegex];
    return [pred evaluateWithObject:self];
}
@end
