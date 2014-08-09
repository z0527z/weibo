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
    //UITableView * _tableView;
}
@end

@implementation ArrayDataSource

#pragma mark - 覆盖 NSObject 的 init 方法
- (id)init DEPRECATED_ATTRIBUTE
{
    // 覆盖 NSObject 的 init 方法，只能通过指定的初始化方法初始化
    return nil;
}

- (id)initWithTable:(UITableView *)tableView Items:(NSArray *)items
{
    if (self = [super init]) {
        _dataArray = [NSArray arrayWithArray:items];
        
        // 设置 tableView 的 header 和 footer
        tableView.sectionHeaderHeight = 5;
        tableView.sectionFooterHeight = 0;
        //    tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // tableView 的 footerView的宽度默认是320, 且不能修改
        NSString * title = [_dataArray lastObject][0][@"name"];
        CGRect rect = CGRectMake(10, 20, 300, 40);
        UIButton * button = [UIButton customButtomWithBg:@"common_button_red.png" title:title frame:rect target:self action:@selector(exitCurrentHost)];
        
        UIView * view = [[UIView alloc]init];
        view.frame = (CGRect){CGPointZero, {0, 80}};
        [view addSubview:button];
        
        tableView.tableFooterView = view;
    }
    
    return self;
}

#pragma mark - UIActionSheet
- (void)exitCurrentHost
{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"确认退出当前账号？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    UIView * view = [UIApplication sharedApplication].keyWindow;
    [sheet showInView:view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * message = buttonIndex == 0 ? @"确认" : @"取消";
    NSLog(@"点击了%@按钮", message);
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_dataArray[0] isKindOfClass:[NSArray class]]) {
        return _dataArray.count - 1;
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

- (id)itemsAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_dataArray[0] isKindOfClass:[NSArray class]]) {
        return _dataArray[indexPath.section];
    }
    else{
        return _dataArray[indexPath.row];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    [cell configCellAtIndexPath:indexPath WithArray:_dataArray];
    
    return cell;
}

#pragma mark - tableView Delegate 定制cell样式
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(tintColor)])
    {
            
        CGFloat cornerRadius = 5.f;
        
        cell.backgroundColor = UIColor.clearColor;
        
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        
        CGMutablePathRef pathRef = CGPathCreateMutable();
        
        // 微调画出的矩形框的位置和大小，以适应
        CGRect rect = cell.bounds;
        rect.origin.x += 1;
        rect.origin.y += 0.8;
        rect.size.width -= 2;
        rect.size.height -= 1.5;
        CGRect bounds = CGRectInset(rect, 0, 0);
        
        BOOL addLine = NO;
        
        // 只有一行
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            
            CGPathAddRoundedRect(pathRef, NULL, bounds, cornerRadius, cornerRadius);
            
        } else if (indexPath.row == 0) { // 头部
            //NSLog(@"path---2:%f, %f, %f, %f, %f", CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            
            CGPathMoveToPoint(pathRef, NULL, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
            
            CGPathAddArcToPoint(pathRef, NULL, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
            
            CGPathAddArcToPoint(pathRef, NULL, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            
            CGPathAddLineToPoint(pathRef, NULL, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            
            addLine = YES;
            
        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) { // 尾部
            
            CGPathMoveToPoint(pathRef, NULL, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
            
            CGPathAddArcToPoint(pathRef, NULL, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
            
            CGPathAddArcToPoint(pathRef, NULL, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            
            CGPathAddLineToPoint(pathRef, NULL, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
            
        } else {
            
            CGPathAddRect(pathRef, NULL, bounds);
            
            addLine = YES;
            
        }
        
        layer.path = pathRef;
        layer.fillColor = [UIColor colorWithWhite:0.8f alpha:0.8f].CGColor;
        
        // 画分隔线
        if (addLine == YES) {
            
            CALayer *lineLayer = [[CALayer alloc] init];
            
            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
            
            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds), bounds.size.height-lineHeight, bounds.size.width, lineHeight);
            
            lineLayer.backgroundColor = tableView.separatorColor.CGColor;
            
            [layer addSublayer:lineLayer];
            
        }
        
        // 将画出的矩形设置为选中状态下显示
        UIView *testView = [[UIView alloc] initWithFrame:bounds];
        [testView.layer insertSublayer:layer atIndex:0];
        testView.backgroundColor = UIColor.clearColor;
        cell.selectedBackgroundView = testView;
        
        CFRelease(pathRef);
    }
        
}

@end
