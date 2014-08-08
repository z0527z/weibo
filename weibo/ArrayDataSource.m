//
//  ArrayDataSource.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "ArrayDataSource.h"
#import "CustomCell.h"

@interface ArrayDataSource ()
{
    NSArray * _dataArray;
}
@end

@implementation ArrayDataSource

#pragma mark - 覆盖 NSObject 的 init 方法
- (id)init DEPRECATED_ATTRIBUTE
{
    // 覆盖 NSObject 的 init 方法，只能通过指定的初始化方法初始化
    return nil;
}

- (id)initWithItems:(NSArray *)items
{
    if (self = [super init]) {
        _dataArray = [NSArray arrayWithArray:items];
    }
    
    return self;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_dataArray[0] isKindOfClass:[NSArray class]]) {
        return _dataArray.count;
    }
    else{
        return 1;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_dataArray[0] isKindOfClass:[NSArray class]]) {
        return ((NSArray *)_dataArray[section]).count;
    }
    else{
        return _dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

@end
