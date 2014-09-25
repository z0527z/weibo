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
                          NSParagraphStyleAttributeName : paragraph
                                    };
    
    CGSize newSize = [self boundingRectWithSize:size
                                             options:NSStringDrawingTruncatesLastVisibleLine |
                                                     NSStringDrawingUsesLineFragmentOrigin |
                                                     NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    
    // 返回的结果需要向上取整
    return CGSizeMake(ceil(newSize.width), ceil(newSize.height));
}

- (NSString *)stringInterval
{
    NSDate * currentDate = [NSDate date];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate * date = [formatter dateFromString:self];
    NSTimeInterval interval = [currentDate timeIntervalSinceDate:date];
    
#warning - 暂时没想到其他好的方法
    NSString * resultString;
    if (interval <= 0) {
        resultString = @"刚刚";
    }
    else if (interval < 60) {
        resultString = [NSString stringWithFormat:@"%.f秒前", interval];
    }
    else if (interval < 60*60) {
        resultString = [NSString stringWithFormat:@"%.f分钟前", interval / 60];
    }
    else if (interval < 60*60*24) {
        resultString = [NSString stringWithFormat:@"%.f小时前", interval / (60*60)];
    }
    else if (interval < 60*60*24*2) {
        resultString = [NSString stringWithFormat:@"昨天"];
    }
    else {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        resultString = [formatter stringFromDate:date];
    }
    
    return resultString;
}

@end
