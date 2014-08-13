//
//  HomeViewController.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "HomeViewController.h"
#import "SendWeiboViewController.h"
#import "AccountMgr.h"
#import "Account.h"
#import "PlainTableDataSource.h"

@interface HomeViewController ()
{
    PlainTableDataSource * _dataSource;
    UITableView * _tableView;
}
@end

@implementation HomeViewController

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
    
    self.title = [AccountMgr sharedAccountMgr].currentAccount.screenName;
    
    NSLog(@"title:%@", self.title);
    
    CGSize size = CGSizeMake(50, 30);
    UIBarButtonItem * leftBarItem = [UIBarButtonItem barButtonWithNormalImage:@"navigationbar_compose.png" size:size target:self action:@selector(sendWeibo)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem * rightBarItem = [UIBarButtonItem barButtonWithNormalImage:@"navigationbar_pop.png" size:size target:self action:@selector(popUpMenu)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    [self requestStatusInfo];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
}

- (void)sendWeibo
{
    NSLog(@"发微博");
    SendWeiboViewController * sendWeibo = [[SendWeiboViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:sendWeibo];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)popUpMenu
{
    NSLog(@"弹出菜单");
}

#pragma mark - 请求用户微博数据
- (void)requestStatusInfo
{
    Account * currentAccount = [AccountMgr sharedAccountMgr].currentAccount;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@?access_token=%@&count=5", kWeiboBaseURL, kStatusInfo, currentAccount.accessToken];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        _dataSource = [[PlainTableDataSource alloc]initWithTable:_tableView Items:responseObject[@"statuses"]];
        _tableView.dataSource = _dataSource;
        _tableView.delegate = _dataSource;
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@ dealloc -->", [self class]);
}

@end
