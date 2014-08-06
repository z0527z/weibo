//
//  UIImage+newFeature.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "UIImage+newFeature.h"

@implementation UIImage (newFeature)
+ (UIImage *)fullScreenImageWithImageName:(NSString *)name
{
    NSString * str = nil;
    if ([DQLCommonMethods isIphone5]) {
//        NSString * imageName = [name stringByDeletingPathExtension];
//        NSString * extention = [name pathExtension];
//        str = [imageName stringByAppendingString:@"-568h@2x"];
//        str = [str stringByAppendingPathExtension:extention];
        [name appendStringWithString:@"-568h@2x"];
    }
    else{
        str = name;
    }
    
    //NSLog(@"str:%@", str);
    
    return [UIImage imageNamed:str];
}
@end
