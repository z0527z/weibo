//
//  Account.h
//  weibo
//
//  Created by dingql on 14-8-12.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

/**
 *  accessToken
 */
@property(nonatomic, strong) NSString * accessToken;

/**
 *  用户ID
 */
@property(nonatomic, strong) NSString * uid;

/**
 *  过期时间
 */
@property(nonatomic, strong) NSString * expiresIn;

/**
 *  用户昵称
 */
@property(nonatomic, strong) NSString * screenName;
@end
