//
//  UIBarButtonItem+customBtn.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (customBtn)

// 创建只有图标的按钮
+ (UIBarButtonItem *)barButtonWithNormalImage:(NSString *)imgName size:(CGSize)size target:(id)target action:(SEL)sel;

// 创建带图片和文字的按钮
+ (UIBarButtonItem *)barButtonWithBg:(NSString *)bgName title:(NSString *)title size:(CGSize)size target:(id)target action:(SEL)sel;
@end
