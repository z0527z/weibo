//
//  DQLCommonMethods.h
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Macro.h"
#import "UIImage+newFeature.h"
#import "NSString+append.h"
#import "UIBarButtonItem+customBtn.h"
#import "UIButton+custom.h"
#import "UIImage+resizeImage.h"
#import "NSString+sizing.h"

#import "ArrayDataSource.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MJExtension/MJExtension.h"

@interface DQLCommonMethods : NSObject

// 判断是否是 iphone5
+ (BOOL) isIphone5;

// 获取屏幕大小
+ (CGRect) screenBounds;

@end
