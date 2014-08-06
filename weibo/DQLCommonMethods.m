//
//  DQLCommonMethods.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "DQLCommonMethods.h"

@implementation DQLCommonMethods

+ (BOOL)isIphone5
{
    return [UIScreen mainScreen].bounds.size.height == 568.0;
}

+ (CGRect)screenBounds
{
    return [UIScreen mainScreen].bounds;
}

@end
