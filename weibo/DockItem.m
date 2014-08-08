//
//  DockItem.m
//  weibo
//
//  Created by dingql on 14-8-6.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "DockItem.h"

#define kImageRatio 0.6

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        //self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * kImageRatio);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    float y = contentRect.size.height * kImageRatio - 5;
    float height = contentRect.size.height * (1 - kImageRatio);
    return CGRectMake(0, y, contentRect.size.width, height);
}

#pragma mark - 覆盖父类默认的行为
- (void)setHighlighted:(BOOL)highlighted
{
    // 覆盖父类高亮时做的一些操作
}

+ (instancetype)DockItemWithText:(NSString *)text Icon:(NSString *)iconName
{
    DockItem * item = [DockItem buttonWithType:UIButtonTypeCustom];
    
    // 设置头像
    [item setImage: [UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [item setImage: [UIImage imageNamed:[iconName appendStringWithString:@"_selected"]] forState:UIControlStateSelected];
    // 设置标题
    [item setTitle:text forState:UIControlStateNormal];
    [item setTitle:text forState:UIControlStateSelected];
    
    return item;
}

@end
