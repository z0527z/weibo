//
//  User.h
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MBTypeNone = 0, // 没有
    MBTypeNormal, // 普通
    MBTypeYear // 年费
} MBType;

typedef enum
{
    VerifiedTypeNone = -1,
    VerifiedTypePersonal = 0, // 个人认证
    VerifiedTypeCompany = 2,
    VerifiedTypeExpert = 220
    
}VerifiedType;

@interface User : NSObject

// 用户ID
@property(nonatomic, strong) NSString * idStr;

// 用户昵称
@property(nonatomic, strong) NSString * screenName;

// 用户头像
@property(nonatomic, strong) NSString * profileImageUrl;

// 是否微博认证
@property(nonatomic, assign) BOOL isVerified;

// 认证类型
@property(nonatomic, assign) int verifiedType;

// 会员类型
@property(nonatomic, assign) MBType mbType;

// 会员等级
@property(nonatomic, assign) int mbRank;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
