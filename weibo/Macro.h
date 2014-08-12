//
//  Macro.h
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#ifndef weibo_Macro_h
#define weibo_Macro_h


#define kLastSoftVersion @"kCFBundleVersionKey"
#define kStatusBarHeight 20

#define kDockHeight 44

#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

// 微博相关
#define kAppKey @"2783540646"
#define kAppSecret @"ca07a4fda7bedb05407e04394c2d7aa2"
#define kRedirectURI @"http://"

// Oauth2.0授权
#define kOauthURL [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@&display=mobile&response_type=token", kAppKey, kRedirectURI]

#define kWeiboBaseURL @"https://api.weibo.com/oauth2/"

#endif
