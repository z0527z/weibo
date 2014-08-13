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
#import "OauthViewController.h"

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kWeiboAppKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 判断当前版本
    UIViewController * rootVC = nil;
    NSString * lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kLastSoftVersion];
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 当前版本无更新
        
        self.oauthVC = [[OauthViewController alloc]init];
        
        typeof(self) __weak weak_self = self;
        _oauthVC.accessOK = ^(){
            if (weak_self) {
                typeof(weak_self) __strong strong_self = weak_self;
                MainViewController * mainVC = [[MainViewController alloc]init];
                strong_self.window.rootViewController = mainVC;
            }
            NSLog(@"convert to MainViewController");
        };
        rootVC = _oauthVC;
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

#pragma mark - 微博相关
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    return [WeiboSDK handleOpenURL:url delegate:_oauthVC];
}

@end
