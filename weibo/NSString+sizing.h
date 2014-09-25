//
//  NSString+sizing.h
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (sizing)
/**
 *  根据给定的字体大小和限制的尺寸返回Label的尺寸
 *
 *  @param font label使用的字体
 *  @param size label中文字限制的尺寸
 *
 *  @return 计算后label的尺寸
 */
- (CGSize)sizeLabelWithFont:(UIFont *)font size:(CGSize)size;

/**
 *  返回类似多少分钟前，这样的字符串
 *
 *  @return 返回类似多少分钟前，这样的字符串
 */
- (NSString *)stringInterval;

@end
