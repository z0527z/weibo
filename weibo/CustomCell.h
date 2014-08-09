//
//  CustomCell.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

- (void)configCellAtIndexPath:(NSIndexPath *)indexPath WithArray:(NSArray *)dataArray;
@end
