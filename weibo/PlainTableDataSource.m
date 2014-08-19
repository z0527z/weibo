//
//  PlainTableDataSource.m
//  weibo
//
//  Created by dingql on 14-8-13.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "PlainTableDataSource.h"
#import "StatusCell.h"
#import "StatusCellFrame.h"
#import "Status.h"

@interface PlainTableDataSource ()
{
    NSMutableArray * _status;
    NSMutableArray * _cellFrames;
}
@end


@implementation PlainTableDataSource

- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items
{
    if (self = [super init]) {
        
        _status = [NSMutableArray array];
        _cellFrames = [NSMutableArray array];
        
        for (int i = 0; i < items.count; i ++) {
            Status * status = [Status objectWithKeyValues:items[i]];
            [_status addObject:status];
        }
        

        
    }
    
    return self;
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"plain_cell";
    StatusCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[StatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.statusCellFrame = _cellFrames[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusCellFrame * cellFrame = [[StatusCellFrame alloc] init];

    cellFrame.status = _status[indexPath.row];
    
    if (![_cellFrames containsObject:cellFrame]) {
        [_cellFrames addObject:cellFrame];
    }
    
    return cellFrame.cellHeight;
}



@end
