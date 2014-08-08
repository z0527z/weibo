//
//  UIButton+custom.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (custom)

// 自定义图片形式的按钮
+ (UIButton *)customButtomWithImage:(NSString *)imgName frame:(CGRect)frame target:(id)target action:(SEL)sel;

// 自定义文字 + 背景的按钮
+ (UIButton *)customButtomWithBg:(NSString *)bgName title:(NSString *)title frame:(CGRect)frame target:(id)target action:(SEL)sel;
@end
