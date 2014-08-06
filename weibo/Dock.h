//
//  Dock.h
//  weibo
//
//  Created by dingql on 14-8-6.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DockItem.h"

#define kDockHeight 44

@interface Dock : UIView

@property(nonatomic, strong) void (^clickedBlock)(int index);

// 标示方法过期时使用 DEPRECATED_ATTRIBUTE 或者 __attribute__((deprecated))
- (void)addItemWithText:(NSString *)text Icon:(NSString *)iconName DEPRECATED_ATTRIBUTE;

- (void)selectDockItemAtIndex:(int)index;

- (void)addItemsWithArray:(NSArray *)array;
@end
