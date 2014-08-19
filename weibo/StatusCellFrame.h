//
//  StatusCellFrame.h
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Status;

@interface StatusCellFrame : NSObject

// cell的数据
@property(nonatomic, strong) Status * status;

// cell的高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;


// 用户头像
@property (nonatomic, assign, readonly) CGRect icon;

// 用户昵称
@property (nonatomic, assign, readonly) CGRect screenName;

// 会员头像
@property (nonatomic, assign, readonly) CGRect mbIcon;

// 创建时间
@property (nonatomic, assign, readonly) CGRect time;

// 微博来源
@property (nonatomic, assign, readonly) CGRect source;

// 微博正文
@property (nonatomic, assign, readonly) CGRect text;

// 微博配图
@property (nonatomic, assign, readonly) CGRect pic;

/*
 被转发的微博信息
 */
@property (nonatomic, assign, readonly) CGRect retweet;

// 被转发用户昵称
@property (nonatomic, assign, readonly) CGRect retweetedScreenName;

// 被转发的微博正文
@property (nonatomic, assign, readonly) CGRect retweetedText;

// 被转发的配图
@property (nonatomic, assign, readonly) CGRect retweetedPic;

@end
