//
//  Status.m
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        // 微博创建时间
        self.createAt = dict[@"created_at"];
        
        // 微博ID
        self.idNum = [dict[@"id"] longLongValue];
        
        // 微博信息内容
        self.text = dict[@"text"];
        
        // 微博来源
        self.source = dict[@"source"];
        
        // 微博作者
        id user = dict[@"user"];
        if (user) {
            self.user = [[User alloc] initWithDictionary:user];
        }
        
        // 被转发的微博
        id retweetedStatus = dict[@"retweeted_status"];
        if (retweetedStatus) {
            self.retweetedStatus = [[Status alloc] initWithDictionary:retweetedStatus];
        }
        
        // 转发数
        self.repostsCount = [dict[@"reposts_count"] intValue];
        
        // 评论数
        self.commentsCount = [dict[@"comments_count"] intValue];
        
        // 表态数
        self.attitudesCount = [dict[@"attitudes_count"] intValue];
        
        // 微博配图地址
        id picUrls = dict[@"pic_urls"];
        if (picUrls) {
            self.picUrls = picUrls;
        }
        
    }
    
    return self;
}

@end
