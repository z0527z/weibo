//
//  User.m
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 用户ID
        self.idStr = dict[@"idstr"];
        
        // 用户昵称
        self.screenName = dict[@"screen_name"];
        
        // 用户头像
        self.profileImageUrl = dict[@"profile_image_url"];
        
        // 是否微博认证
        self.isVerified = [dict[@"verified"] boolValue];
        
        // 认证类型
        self.verifiedType = [dict[@"verified_type"] intValue];
        
        // 会员类型
        self.mbType = [dict[@"mbtype"] intValue];
        
        // 会员等级
        self.mbRank = [dict[@"mbrank"] intValue];
    }
    
    return self;
}

@end
