//
//  NSString+sizing.m
//  weibo
//
//  Created by dingql on 14-8-19.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "NSString+sizing.h"

@implementation NSString (sizing)

- (CGSize)sizeLabelWithFont:(UIFont *)font size:(CGSize)size
{
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attribute = @{
                                    NSFontAttributeName : font,
                          NSParagraphStyleAttributeName : paragraph };
    
    CGSize newSize = [self boundingRectWithSize:size
                                             options:NSStringDrawingTruncatesLastVisibleLine |
                                                     NSStringDrawingUsesLineFragmentOrigin |
                                                     NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    
    // 返回的结果需要向上取整
    return CGSizeMake(ceil(newSize.width), ceil(newSize.height));
}

@end
