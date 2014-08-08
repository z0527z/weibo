//
//  MoreViewController.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController () <UITableViewDelegate>
{
    ArrayDataSource * _tableViewDataSource;
}
@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"更多";
    
    // 设置导航栏按钮
    CGSize size = CGSizeMake(50, 30);
    UIBarButtonItem * rightBarItem = [UIBarButtonItem barButtonWithBg:@"navigationbar_button_background.png" title:@"设置" size:size target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    // 加载plist文件
    NSString * path = [[NSBundle mainBundle]pathForResource:@"more.plist" ofType:nil];
    NSArray * array = [NSDictionary dictionaryWithContentsOfFile:path][@"zh_CN"];
    
    // 添加 UITableView
    NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
    CGRect rect = (CGRect){{0, 0}, {self.view.bounds.size.width ,self.view.bounds.size.height - kDockHeight}};
    
    // UITableView group样式时 HeaderView 会默认显示出来，plain 样式时则默认不会显示出来
    UITableView * tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    
    // 必须使用成员变量保存，否则会挂掉
    _tableViewDataSource = [[ArrayDataSource alloc]initWithItems:array];

    tableView.delegate = self;
    tableView.dataSource = _tableViewDataSource;
    [self.view addSubview:tableView];
    
    // 设置 tableView 的 header 和 footer
    tableView.sectionHeaderHeight = 5;
    tableView.sectionFooterHeight = 0;

}



#pragma mark - 设置
- (void)setting
{
    NSLog(@"setting");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}


@end
