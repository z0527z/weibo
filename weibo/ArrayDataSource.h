//
//  ArrayDataSource.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayDataSource : NSObject <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items;
@end
