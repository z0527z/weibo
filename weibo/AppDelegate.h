//
//  AppDelegate.h
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"

@class OauthViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) OauthViewController * oauthVC;

@end
