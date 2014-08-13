//
//  PlainTableDataSource.h
//  weibo
//
//  Created by dingql on 14-8-13.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlainTableDataSource : NSObject<UITableViewDelegate, UITableViewDataSource>

- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items;
@end
