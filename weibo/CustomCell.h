//
//  CustomCell.h
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

/*!
 * @brief 使用数组数据定制cell
 * @warning 数组目前必须是二维数组，且最里层的数组中需要有 name 的key
 * @param indexPath 没什么好说的
 * @param dataArray 定制cell所使用的数组
 * @return 明显的什么也没返回嘛
 * @code [self configCellAtIndexPath:indexPath WithArray:dataArray];
 */
- (void)configCellAtIndexPath:(NSIndexPath *)indexPath WithArray:(NSArray *)dataArray;


@end
