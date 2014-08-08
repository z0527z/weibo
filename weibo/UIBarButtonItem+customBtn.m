//
//  UIBarButtonItem+customBtn.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "UIBarButtonItem+customBtn.h"

@implementation UIBarButtonItem (customBtn)

+ (UIBarButtonItem *)barButtonWithNormalImage:(NSString *)imgName size:(CGSize)size target:(id)target action:(SEL)sel
{

    CGRect rect = (CGRect){CGPointZero, size};
    UIButton * button = [UIButton customButtomWithImage:imgName frame:rect target:target action:sel];
    
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return barItem;
}

+ (UIBarButtonItem *)barButtonWithBg:(NSString *)bgName title:(NSString *)title size:(CGSize)size target:(id)target action:(SEL)sel
{
    CGRect rect = (CGRect){CGPointZero, size};
    UIButton * button = [UIButton customButtomWithBg:bgName title:title frame:rect target:target action:sel];
    
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return barItem;
}

@end
