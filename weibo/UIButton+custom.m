//
//  UIButton+custom.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "UIButton+custom.h"

@implementation UIButton (custom)
+ (UIButton *)customButtomWithImage:(NSString *)imgName frame:(CGRect)frame target:(id)target action:(SEL)sel
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    NSString * highlightedImgName = [imgName appendStringWithString:@"_highlighted"];
    [button setImage:[UIImage imageNamed:highlightedImgName] forState:UIControlStateHighlighted];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)customButtomWithBg:(NSString *)bgName title:(NSString *)title frame:(CGRect)frame target:(id)target action:(SEL)sel
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    // 设置文字
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//    [button setTitle:title forState:UIControlStateHighlighted];
    
    // 设置拉伸后的普通状态下的图片
    UIImage * resizedNormalImg = [UIImage resizeImageWithImg:bgName];
    [button setBackgroundImage:resizedNormalImg forState:UIControlStateNormal];
    
    // 设置拉伸后的高亮状态下的图片
    NSString * highlightedImgName = [bgName appendStringWithString:@"_highlighted"];
    UIImage * resizedHightedImg = [UIImage resizeImageWithImg:highlightedImgName];
    [button setBackgroundImage: resizedHightedImg forState:UIControlStateHighlighted];
    
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
@end
