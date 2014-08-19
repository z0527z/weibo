//
//  Macro.h
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#ifndef weibo_Macro_h
#define weibo_Macro_h

// 版本更新相关
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


// 微博更新数据相关
#define kNavigationBarHeight    44

/*
微博cell相关
 */

// 间距
#define kCellPadding    10
// 头像
#define kIconWidth      50
#define kIconHeight     kIconWidth
// 昵称
#define kScreenNameFont [UIFont systemFontOfSize:17.0]

// 会员
#define kMbIconWidth    14
#define kMbIconHeight   kMbIconWidth

// 创建时间
#define kCreateAtFont   [UIFont systemFontOfSize:14.0]

// 来源
#define kSourceFont     [UIFont systemFontOfSize:14.0]

// 正文
#define kTextFont       [UIFont systemFontOfSize:15.0]

// 被转微博的昵称
#define kRetweetedScreenNameFont    [UIFont systemFontOfSize:14.0]

// 被转微博正文
#define kRetweetedTextFont          [UIFont systemFontOfSize:12.0]

#endif
