//
//  NSString+date.m
//  weibo
//
//  Created by dingql on 14-8-24.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "NSString+date.h"

@implementation NSString (date)

- (NSString *)stringFromDateString:(NSString *)dateString
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    
    NSDate * date = [formatter dateFromString:dateString];
    
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];
    
    NSString * newStr = nil;
   
//    NSDictionary * dict = @{ @60                    : @"刚刚",
//                             @(60 * 60)             : @"%d分钟前",
//                             @(60 * 60 * 24)        : @"%d小时前",
//                             @(60 * 60 * 24 * 2)    : @"昨天",
//                             };
//    if (<#condition#>) {
//        <#statements#>
//    }
    
    return newStr;
}

@end
