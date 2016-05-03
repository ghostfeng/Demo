//
//  UIViewController+YFCategory.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/4.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "UIViewController+YFCategory.h"
#import <objc/runtime.h>

@implementation NSObject (MJRefresh)

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end
@implementation UIViewController (YFCategory)

#pragma mark - swizzle
+ (void)load
{
    [self exchangeInstanceMethod1:NSSelectorFromString(@"dealloc") method2:@selector(deallocSwizzle)];
    [self exchangeInstanceMethod1:@selector(didReceiveMemoryWarning) method2:@selector(didReceiveMemoryWarningSwizzle)];
    
    [self exchangeInstanceMethod1:@selector(viewDidLoad) method2:@selector(viewDidLoadSwizzle)];
}

- (void)viewDidLoadSwizzle
{
    self.hasBackItem = (self.navigationController.viewControllers.count > 1);
    [self viewDidLoadSwizzle];
}
- (void)deallocSwizzle
{
    NSLog(@"%@被销毁了！！！", [self class]);
    //移除通知的监听
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self deallocSwizzle];
}

- (void)didReceiveMemoryWarningSwizzle
{
    NSLog(@"%@内存警告！！！", [self class]);
    [self didReceiveMemoryWarningSwizzle];
}

#pragma mark - backAction
- (void)backAction
{
    for (NSURLSessionDataTask *task in self.tasks) {
        if (task.state == NSURLSessionTaskStateRunning)[task cancel];
    }
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if(self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
/** 设置导航栏标题 */
- (void)setNavigationTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

#pragma mark - getter/setter
- (void)setTask:(NSURLSessionDataTask *)task
{
    if (task != self.task) {
        
        //存储上次请求
        if (!self.tasks) {
            self.tasks = [[NSMutableArray alloc]init];
        }
        [self.tasks addObject:task];
        
        // 存储新的
        [self willChangeValueForKey:@"task"];
        objc_setAssociatedObject(self, @selector(task), task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"task"];
    }
}

- (NSURLSessionDataTask *)task
{
    return (NSURLSessionDataTask *)objc_getAssociatedObject(self, @selector(task));
}

- (void)setHasRefreshed:(BOOL)hasRefreshed
{
    if (hasRefreshed != self.hasRefreshed) {
        // 存储新的
        [self willChangeValueForKey:@"hasRefreshed"];
        objc_setAssociatedObject(self, @selector(hasRefreshed), @(hasRefreshed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"hasRefreshed"];
    }
}

- (BOOL)hasRefreshed
{
    return (BOOL)objc_getAssociatedObject(self, @selector(hasRefreshed));
}

- (void)setTasks:(NSMutableArray *)tasks
{
    if (self.tasks != tasks) {
        // 存储新的
        [self willChangeValueForKey:@"tasks"];
        objc_setAssociatedObject(self, @selector(tasks), tasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"tasks"];
    }
}

- (NSMutableArray *)tasks
{
    return (NSMutableArray *)objc_getAssociatedObject(self, @selector(tasks));
}

-(void)setHasBackItem:(BOOL)hasBackItem
{
    if (self.hasBackItem != hasBackItem) {
        // 存储新的
        [self willChangeValueForKey:@"hasBackItem"];
        objc_setAssociatedObject(self, @selector(hasBackItem), @(hasBackItem), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"hasBackItem"];
    }
    if (hasBackItem == YES) {
        UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
        
        spaceItem.width = -25;
        UIBarButtonItem * backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ty_fh"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        self.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
    }else{
        self.navigationItem.leftBarButtonItems = nil;
    }
}

-(BOOL)hasBackItem
{
    return [objc_getAssociatedObject(self, @selector(hasBackItem)) boolValue];
}

@end
