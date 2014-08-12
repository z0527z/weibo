//
//  ArrayDataSource.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayDataSource : NSObject <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

// FIXME: This is broken
// !!!: Holy cow, it should be checked!
// ???: Perhaps check if the block is not nil first?
- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items;
@end
