
#import <UIKit/UIKit.h>

/**
 *  @brief 获取当前区域的中心点
 *
 *  @param rect 当前区域
 *
 *  @return 中心点
 */
CGPoint CGRectGetCenter(CGRect rect);
/**
 *  @brief 通过中心点和宽高创建区域
 *
 *  @param center 中心点
 *  @param width  宽
 *  @param height 高
 *
 *  @return 区域
 */
CGRect CGRectMakeWithCenter(CGPoint center,CGFloat width,CGFloat height);

@interface UIView (Category)

/** xib的裁剪半径 */
@property (nonatomic,assign) IBInspectable CGFloat cornerRadius;
/** xib的边缘线宽度 */
@property (nonatomic,assign) IBInspectable CGFloat borderWidth;
/** xib的边缘线颜色 */
@property (nonatomic,strong) IBInspectable UIColor *borderColor;
/** 视图左下坐标 */
@property (readonly) CGPoint bottomLeft;
/** 视图右下坐标 */
@property (readonly) CGPoint bottomRight;
/** 视图右上坐标 */
@property (readonly) CGPoint topRight;
/** 视图左上坐标 */
@property CGPoint origin;
/** 视图大小 */
@property CGSize size;
/** 视图高 */
@property CGFloat height;
/** 视图宽 */
@property CGFloat width;
/** 视图顶部y坐标 */
@property CGFloat top;
/** 视图底部y坐标 */
@property CGFloat bottom;
/** 视图左边x坐标 */
@property CGFloat left;
/** 视图右边x坐标 */
@property CGFloat right;

/**
 *  @brief  通过响应者链获取当前视图所在的控制器
 *
 *  @return UIViewController
 */
- (UIViewController *)viewController;

/**
 *  @brief  对视图进行裁剪
 *
 *  @param radius 裁剪半径
 */
- (void)cornerWithRadius:(CGFloat)radius;

/**
 *  @brief  给视图添加边框
 *
 *  @param borderColor 颜色
 *  @param borderWidth 边框线条宽度
 */
- (void)borderWithColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
