//
//  Account.m
//  weibo
//
//  Created by dingql on 14-8-12.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "Account.h"

@interface Account ()<NSCoding>

@end

@implementation Account

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.accessToken = [aDecoder decodeObjectForKey:@"access_token"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.expiresIn = [aDecoder decodeObjectForKey:@"expires_in"];
        self.screenName = [aDecoder decodeObjectForKey:@"screen_Name"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_accessToken forKey:@"access_token"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_expiresIn forKey:@"expires_in"];
    [aCoder encodeObject:_screenName forKey:@"screen_Name"];
    
}

@end
