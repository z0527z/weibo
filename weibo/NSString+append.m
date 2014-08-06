//
//  NSString+append.m
//  weibo
//
//  Created by dingql on 14-8-6.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "NSString+append.h"

@implementation NSString (append)

- (NSString *)appendStringWithString:(NSString *)string
{
    NSString * partBeforeExtention = [self stringByDeletingPathExtension];
    NSString * extention = [self pathExtension];
    
    NSString * newStr = [partBeforeExtention stringByAppendingString:string];
    
    return [newStr stringByAppendingPathExtension:extention];
}

@end
