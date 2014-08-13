//
//  PlainTableDataSource.m
//  weibo
//
//  Created by dingql on 14-8-13.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "PlainTableDataSource.h"

@interface PlainTableDataSource ()
{
    NSArray * _dataArray;
}
@end


@implementation PlainTableDataSource

- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items
{
    if (self = [super init]) {
        _dataArray = [NSArray arrayWithArray:items];
        

        
    }
    
    return self;
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"number:%d", _dataArray.count);
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell");
    static NSString * identifier = @"plain_cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row][@"text"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
