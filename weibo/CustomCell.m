//
//  CustomCell.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()
@property(nonatomic, strong) UIView * vContainerView;
@property(nonatomic, assign) BOOL top;
@property(nonatomic, assign) BOOL bottom;
@end

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}

#pragma mark - 调整cell的宽度
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}

#pragma mark - configCell
- (void)configCellAtIndexPath:(NSIndexPath *)indexPath WithArray:(NSArray *)dataArray
{
    NSString * cellBgName = nil;
    NSArray * sectionArray = (NSArray *)dataArray[indexPath.section];
    if (sectionArray.count == 1) {
        cellBgName = @"common_card_background.png";
    }
    else if (indexPath.row == 0){
        cellBgName = @"common_card_top_background.png";
    }
    else if (indexPath.row == sectionArray.count - 1)
    {
        cellBgName = @"common_card_bottom_background.png";
    }
    else{
        cellBgName = @"common_card_middle_background.png";
    }
    
    // IOS7以上直接用图片来定制cell背景和选中背景, 亦可以采用画线解决（定制cell）
    NSString * selectedBgName = [cellBgName appendStringWithString:@"_highlighted"];
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage resizeImageWithImg:cellBgName]];
    self.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage resizeImageWithImg:selectedBgName]];
    self.textLabel.text = dataArray[indexPath.section][indexPath.row][@"name"];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.backgroundColor = [UIColor clearColor];
    
    // 修改cell中内容距左边的宽度
    //    cell.indentationWidth = 5;
    //    cell.indentationLevel = 2;
}

- (void)prepareForReuse
{
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
