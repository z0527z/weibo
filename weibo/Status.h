//
//  Status.h
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 created_at         string	微博创建时间
 id                 int64   微博ID
 text               string	微博信息内容
 source             string	微博来源
 user               object	微博作者的用户信息字段
 retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回
 reposts_count      int     转发数
 comments_count     int     评论数
 attitudes_count	int     表态数
 pic_urls           object	微博配图地址。多图时返回多图链接。无配图返回“[]”
 */

@class User;

@interface Status : NSObject

// 微博创建时间
@property(nonatomic, strong) NSString * createAt;

// 微博ID
@property(nonatomic, assign) long long idNum;

// 微博信息内容
@property(nonatomic, strong) NSString * text;

// 微博来源
@property(nonatomic, strong) NSString * source;

// 微博作者
@property(nonatomic, strong) User * user;

// 被转发的微博
@property(nonatomic, strong) Status * retweetedStatus;

// 转发数
@property(nonatomic, assign) int repostsCount;

// 评论数
@property(nonatomic, assign) int commentsCount;

// 表态数
@property(nonatomic, assign) int attitudesCount;

// 微博配图地址
@property(nonatomic, strong) NSMutableArray * picUrls;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
