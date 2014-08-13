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
#define kWeiboAppKey @"3623286338"
#define kWeiboAppSecret @"2efb43d63afc33b7a28fe8f965d82d5a"
#define kWeiboRedirectURI @"https://api.weibo.com/oauth2/default.html"



#define kWeiboBaseURL @"https://api.weibo.com/2/"

#define kUserInfo @"users/show.json"
#define kStatusInfo @"statuses/home_timeline.json"

#endif
