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
    CGSize timeSize = [status.createAt sizeLabelWithFont:kCreateAtFont size:constrainedSize];
    
    _time = (CGRect){{timeX, timeY}, timeSize};
    
    // 来源
    CGFloat sourceX = CGRectGetMaxX(_time) + kCellPadding;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeLabelWithFont:kSourceFont size:constrainedSize];
    
    _source = (CGRect){{sourceX, sourceY}, sourceSize};
    
    // 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_source) + kCellPadding;
    CGSize textSize = [status.text sizeLabelWithFont:kTextFont size:constrainedSize];
    
    _text = (CGRect){{textX, textY}, textSize};
    
    if (status.picUrls) {
        CGFloat picX = iconX;
        CGFloat picY = CGRectGetMaxY(_text) + kCellPadding;
        UIImage * placeHolderImage = [UIImage imageNamed:@"timeline_image_placeholder.png"];
        
//        for (int i = 0; i < status.picUrls.count; i ++) {
//            UIImageView * imageView = [[UIImageView alloc]init];
//            NSURL * imageUrl = [NSURL URLWithString:status.picUrls[i]];
//            [imageView sd_setImageWithURL:imageUrl placeholderImage:placeHolderImage options:SDWebImageLowPriority | SDWebImageRetryFailed];
//            
//            // 照片以九宫格的形式排列
//            CGFloat X = (i % 3) * placeHolderImage.size.width + picX;
//            CGFloat Y = (i / 3) * placeHolderImage.size.height + picY;
//            imageView.frame = (CGRect){{X, Y}, placeHolderImage.size};
//        }
        int count = status.picUrls.count;
        CGFloat width = (count % 3) * placeHolderImage.size.width;
        CGFloat height = ceil( (count+1) / 3) * placeHolderImage.size.height;
        _pic = CGRectMake(picX, picY, width, height);
    }
    
    /*
     被转发微博信息
     */
    if (status.retweetedStatus) {
        CGSize retweetedContrainSize = CGSizeMake(constrainedSize.width - 2 * kCellPadding, constrainedSize.height);
        
        CGFloat retweetedX = iconX;
        CGFloat retweetedY = CGRectGetMaxY(_text) + kCellPadding;
        CGFloat retweetedWidth = constrainedSize.width;
        
        // 转发微博的昵称
        CGFloat retweetedScreenNameX = kCellPadding;
        CGFloat retweetedScreenNameY = kCellPadding;
        NSString * string = [NSString stringWithFormat:@"@%@", status.retweetedStatus.user.screenName];
        CGSize retweetedScreenNameSize = [string sizeLabelWithFont:kRetweetedScreenNameFont size:retweetedContrainSize];
        
        _retweetedScreenName = (CGRect){{retweetedScreenNameX, retweetedScreenNameY}, retweetedScreenNameSize};
        
        // 转发微博的正文
        CGFloat retweetedTextX = retweetedScreenNameX;
        CGFloat retweetedTextY = CGRectGetMaxY(_retweetedScreenName) + kCellPadding;
        CGSize retweetedTextSize = [status.retweetedStatus.text sizeLabelWithFont:kRetweetedTextFont size:retweetedContrainSize];
        
        _retweetedText = (CGRect){{retweetedTextX, retweetedTextY}, retweetedTextSize};
        
        // 转发微博的配图
        if (status.retweetedStatus.picUrls) {
            CGFloat retweetedPicX = retweetedScreenNameX;
            CGFloat retweetedPicY = CGRectGetMaxY(_retweetedText) + kCellPadding;
            UIImage * placeHolderImage = [UIImage imageNamed:@"timeline_image_placeholder.png"];
            
            int count = status.retweetedStatus.picUrls.count;
            CGFloat width = (count % 3) * placeHolderImage.size.width;
            CGFloat height = (count / 3) * placeHolderImage.size.height;
            _retweetedPic = CGRectMake(retweetedPicX, retweetedPicY, width, height);
        }
        
        CGFloat retweetedHeight = CGRectGetMaxY(_retweetedText);
        if (status.retweetedStatus.picUrls) {
            retweetedHeight = CGRectGetMaxY(_retweetedPic);
        }
        
        _retweet = CGRectMake(retweetedX, retweetedY, retweetedWidth, retweetedHeight);
        
    }
    
    _cellHeight = CGRectGetMaxY(_text);
    if (status.picUrls) {
        _cellHeight = CGRectGetMaxY(_pic);
    }
    if (status.retweetedStatus) {
        _cellHeight = CGRectGetMaxY(_retweet);
    }
}

@end
