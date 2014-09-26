//
//  StatusCellFrame.m
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "StatusCellFrame.h"
#import "Status.h"
#import "User.h"

@implementation StatusCellFrame

- (void)setStatus:(Status *)status
{
    _status = status;
    CGRect rect = [DQLCommonMethods screenBounds];
    CGSize constrainedSize = CGSizeMake(rect.size.width - 2 * kCellPadding, MAXFLOAT);
    // 头像
    CGFloat iconX = kCellPadding;
    CGFloat iconY = kCellPadding;
    
    _icon = CGRectMake(iconX, iconY, kIconWidth, kIconHeight);
    
    // 昵称
    CGFloat screenNameX = CGRectGetMaxX(_icon) + kCellPadding;
    CGFloat screenNameY = iconY;
    CGSize screenNameSize = [status.user.screenName sizeLabelWithFont:kScreenNameFont size:constrainedSize];
    
    _screenName = (CGRect){{screenNameX, screenNameY}, screenNameSize};
    
    // 会员图标
    CGFloat mbIconX = CGRectGetMaxX(_screenName) + kCellPadding;
    CGFloat mbIconY = CGRectGetMidY(_screenName) - kMbIconHeight * 0.5;
    
    _mbIcon = CGRectMake(mbIconX, mbIconY, kMbIconWidth, kMbIconHeight);
    
    // 创建时间
    CGFloat timeX = screenNameX;
    CGFloat timeY = CGRectGetMaxY(_screenName) + kCellPadding;
    CGSize timeSize = [[status.createAt stringInterval] sizeLabelWithFont:kCreateAtFont size:constrainedSize];
    
    _time = (CGRect){{timeX, timeY}, timeSize};
    
    // 来源
    CGFloat sourceX = CGRectGetMaxX(_time) + kCellPadding;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeLabelWithFont:kSourceFont size:constrainedSize];
    
    _source = (CGRect){{sourceX, sourceY}, sourceSize};
    
    // 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_source) + kCellPadding;
    // 支持得貌似不是很好，手动调整
    CGSize adjustedContrainedSize = CGSizeMake(constrainedSize.width - kCellPadding, constrainedSize.height);
    CGSize textSize = [status.text sizeLabelWithFont:kTextFont size:adjustedContrainedSize];
    
    _text = (CGRect){{textX, textY}, textSize};
    
    float imageTotalHeight = CGRectGetMaxY(_text) + kCellPadding;
    if (status.picUrls) {
        _picsRect = [NSMutableArray array];
        CGFloat picX = iconX;
        CGFloat picY = CGRectGetMaxY(_text) + kCellPadding;
        UIImage * placeHolderImage = kPlaceHolderImage;
        float width = placeHolderImage.size.width;
        float height = placeHolderImage.size.height;
        int count = status.picUrls.count;
        
        int X = 0, Y = 0;
        for (int i = 0; i < count; i ++) {
            X = (i % 3) * width + (i % 3) * kCellPadding;
            Y = (i / 3) * height + (i / 3) * kCellPadding;
            
            CGRect rect = CGRectMake(X, Y, width, height);
            
            [_picsRect addObject:NSStringFromCGRect(rect)];
        }
        float imageHeight = ((count + 2) / 3) * height + ((count + 2)/ 3 - 1) * kCellPadding;
        _imageBackViewRect = CGRectMake(picX, picY, constrainedSize.width, imageHeight);
        imageTotalHeight += imageHeight;
    }
    
    /*
     被转发微博信息
     */
    if (status.retweetedStatus) {
        CGSize retweetedContrainSize = CGSizeMake(constrainedSize.width - 2 * kCellPadding, constrainedSize.height);
        
        CGFloat retweetedX = iconX;
        CGFloat retweetedY = CGRectGetMaxY(_text) + kCellPadding;
        CGFloat retweetedWidth = retweetedContrainSize.width;
        
        // 转发微博的昵称
        CGFloat retweetedScreenNameX = kCellPadding;
        CGFloat retweetedScreenNameY = kCellPadding;
        NSString * string = [NSString stringWithFormat:@"@%@", status.retweetedStatus.user.screenName];
        CGSize retweetedScreenNameSize = [string sizeLabelWithFont:kRetweetedScreenNameFont size:retweetedContrainSize];
        
        _retweetedScreenName = (CGRect){{retweetedScreenNameX, retweetedScreenNameY}, retweetedScreenNameSize};
        
        // 转发微博的正文
        CGFloat retweetedTextX = retweetedScreenNameX;
        CGFloat retweetedTextY = CGRectGetMaxY(_retweetedScreenName) + kCellPadding;
        // 支持得貌似不是很好，手动调整
        CGSize adjustedRetweetedContrainSize = CGSizeMake(retweetedContrainSize.width - kCellPadding, retweetedContrainSize.height);
        CGSize retweetedTextSize = [status.retweetedStatus.text sizeLabelWithFont:kRetweetedTextFont size:adjustedRetweetedContrainSize];
        
        _retweetedText = (CGRect){{retweetedTextX, retweetedTextY}, retweetedTextSize};
        
        // 转发微博的配图
        if (status.retweetedStatus.picUrls) {
            CGFloat retweetedPicX = retweetedScreenNameX;
            CGFloat retweetedPicY = CGRectGetMaxY(_retweetedText) + kCellPadding;
            UIImage * placeHolderImage = kPlaceHolderImage;
            
            CGFloat width = placeHolderImage.size.width;
            CGFloat height = placeHolderImage.size.height;
            _retweetedPic = CGRectMake(retweetedPicX, retweetedPicY, width, height);
        }
        
        CGFloat retweetedHeight = CGRectGetMaxY(_retweetedText);
        if (status.retweetedStatus.picUrls) {
            retweetedHeight = CGRectGetMaxY(_retweetedPic);
        }
        retweetedHeight += 10;
        
        _retweet = CGRectMake(retweetedX, retweetedY, retweetedWidth, retweetedHeight);
        
    }
    
    _cellHeight = CGRectGetMaxY(_text);
    if (status.picUrls) {
        _cellHeight = CGRectGetMaxY(_imageBackViewRect);
    }
    if (status.retweetedStatus) {
        _cellHeight = CGRectGetMaxY(_retweet);
    }
    
    _cellHeight += 10;
}

@end
