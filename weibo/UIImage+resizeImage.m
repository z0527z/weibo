//
//  UIImage+resizeImage.m
//  weibo
//
//  Created by dingql on 14-8-9.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "UIImage+resizeImage.h"

@implementation UIImage (resizeImage)
+ (UIImage *)resizeImageWithImg:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    CGSize imgSize = image.size;
    UIEdgeInsets inset = UIEdgeInsetsMake(imgSize.height * 0.5, imgSize.width * 0.5, imgSize.height * 0.5, imgSize.width * 0.5);
    UIImage * resizedImage = [image resizableImageWithCapInsets:inset];
    
    return resizedImage;
}
@end
