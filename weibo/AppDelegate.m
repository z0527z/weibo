//
//  AppDelegate.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "AppDelegate.h"
#import "NewFeatureViewController.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 判断当前版本
    UIViewController * rootVC = nil;
    NSString * lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kLastSoftVersion];
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 当前版本无更新
        
        MainViewController * mainVC = [[MainViewController alloc]init];
        rootVC = mainVC;
    }
    else{
        // 更新保存的版本号
        lastVersion = currentVersion;
        [[NSUserDefaults standardUserDefaults]setObject:lastVersion forKey:kLastSoftVersion];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        // 加载新特性界面
        //[UIApplication sharedApplication].statusBarHidden = YES;
        NewFeatureViewController * newFeatureVC = [[NewFeatureViewController alloc]init];
        rootVC = newFeatureVC;
    }
    
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
