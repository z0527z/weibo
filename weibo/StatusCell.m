//
//  StatusCell.m
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "StatusCell.h"
#import "StatusCellFrame.h"
#import "Status.h"
#import "User.h"

@interface StatusCell ()
{
    // 用户头像
    UIImageView * _icon;
    
    // 用户昵称
    UILabel * _screenName;
    
    // 会员头像
    UIImageView * _mbIcon;
    
    // 创建时间
    UILabel * _time;
    
    // 微博来源
    UILabel * _source;
    
    // 微博正文
    UILabel * _text;
    
    // 微博配图
    UIImageView * _pic;
    
    /*
     被转发的微博信息
     */
    UIImageView * _retweet;
    
    // 被转发用户昵称
    UILabel * _retweetedScreenName;
    
    // 被转发的微博正文
    UILabel * _retweetedText;
    
    // 被转发的配图
    UIImageView * _retweetedPic;
    
}
@end


@implementation StatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 1. 添加微博本身的子控件
        [self addStatusControl];
        
        // 2. 添加被转发的微博子控件
        [self addRetweetedStatusControl];
        
        // 3. 添加其他的
        [self addOtherControl];
    }
    return self;
}

#pragma mark - 添加微博本身控件
- (void)addStatusControl
{
    // 用户头像
    _icon = [[UIImageView alloc] init];
    _icon.layer.cornerRadius = kIconWidth * 0.5;
    _icon.layer.masksToBounds = YES;
    [self addSubview:_icon];
    
    // 用户昵称
    _screenName = [[UILabel alloc] init];
    _screenName.font = kScreenNameFont;
    [self addSubview:_screenName];
    
    // 会员头像
    _mbIcon = [[UIImageView alloc] init];
    [self addSubview:_mbIcon];;
    
    // 创建时间
    _time = [[UILabel alloc] init];
    _time.font = kCreateAtFont;
    [self addSubview:_time];
    
    // 微博来源
    _source = [[UILabel alloc] init];
    _source.font = kSourceFont;
    [self addSubview:_source];
    
    // 微博正文
    _text = [[UILabel alloc] init];
    _text.font = kTextFont;
    _text.numberOfLines = 0;
    [self addSubview:_text];
    
    // 微博配图
    _pic = [[UIImageView alloc] init];
    [self addSubview:_pic];
}

#pragma mark - 添加被转发微博控件
- (void)addRetweetedStatusControl
{
    // 转发背景
    _retweet = [[UIImageView alloc] init];
    [self addSubview:_retweet];
    
    // 被转发用户昵称
    _retweetedScreenName = [[UILabel alloc] init];
    _retweetedScreenName.font = kRetweetedScreenNameFont;
    [_retweet addSubview:_retweetedScreenName];
    
    // 被转发的微博正文
    _retweetedText = [[UILabel alloc] init];
    _retweetedText.font = kRetweetedTextFont;
    _retweetedText.numberOfLines = 0;
    [_retweet addSubview:_retweetedText];
    
    // 被转发的配图
    _retweetedPic = [[UIImageView alloc] init];
    [_retweet addSubview:_retweetedPic];
}

#pragma mark - 添加其他控件
- (void)addOtherControl
{
    
}

#pragma mark - 给cell设置数据
- (void)setStatusCellFrame:(StatusCellFrame *)statusCellFrame
{
    _statusCellFrame = statusCellFrame;
    
    // 设置头像
    UIImage * userPlaceHolderImage = [UIImage imageNamed:@"avatar_default.png"];
    NSURL * url = [NSURL URLWithString:statusCellFrame.status.user.profileImageUrl];
#warning 这里也必须设置frame, 这才真正设置到cell上
    _icon.frame = statusCellFrame.icon;
    [_icon sd_setImageWithURL: url placeholderImage:userPlaceHolderImage];
    
    // 设置昵称
    [_screenName setText:statusCellFrame.status.user.screenName];
    _screenName.frame = statusCellFrame.screenName;
    
    // 会员头像
    Status * status = statusCellFrame.status;
    User * user = status.user;
    _mbIcon.image = [UIImage imageNamed:@"common_icon_membership.png"];
    if (user.mbType == MBTypeNone) {
        _mbIcon.hidden = YES;
        _screenName.textColor = kScreenNameColor;
    }
    else {
        _mbIcon.hidden = NO;
        _screenName.textColor = kMBScreenNameColor;
    }

    
    // 创建时间
    _time.frame = statusCellFrame.time;
    _time.text = [status.createAt stringInterval];
    // 微博来源
    _source.text = status.source;
    _source.frame = statusCellFrame.source;
    // 微博正文
    _text.frame = statusCellFrame.text;
    [_text setText:status.text];
    
    // 带图片的微博
    if (status.picUrls) {
        _retweet.hidden = YES;
        _pic.hidden = NO;
        url = [NSURL URLWithString:status.picUrls[0]];
        [_pic sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default.png"]];
        _pic.frame = statusCellFrame.pic;
    }
    
    // 带转发的微博
    else if (status.retweetedStatus) {
        _retweet.hidden = NO;
        _pic.hidden = YES;
        UIImage * image = [UIImage imageNamed:@"timeline_retweet_background.png"];
        _retweet.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.9, image.size.height * 0.5, image.size.width * 0.1)];
        
        _retweet.frame = statusCellFrame.retweet;
        
        // 被转微博用户昵称
        _retweetedScreenName.text = status.retweetedStatus.user.screenName;
        _retweetedScreenName.frame = statusCellFrame.retweetedScreenName;
        
        // 被转微博内容
        _retweetedText.text = status.retweetedStatus.text;
        _retweetedText.frame = statusCellFrame.retweetedText;
        
        // 被转微博配图(如果有的话)
        if (status.retweetedStatus.picUrls) {
            url = [NSURL URLWithString:status.retweetedStatus.picUrls[0]];
            [_retweetedPic sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default.png"]];
            _retweetedPic.frame = statusCellFrame.retweetedPic;
        }
        
        
    }
    // 纯文本微博
    else {
        _retweet.hidden = YES;
        _pic.hidden = YES;
    }
    
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
