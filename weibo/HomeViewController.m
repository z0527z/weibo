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
        
        //[self requestStatusInfo];
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
    
    // 添加 tableView
    CGRect rect = self.view.bounds;
    rect.size.height -= kDockHeight;
    _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    // 添加刷新
    [_tableView addHeaderWithTarget:self action:@selector(refreshHeader)];
    [_tableView addFooterWithTarget:self action:@selector(refreshFooter)];
    [_tableView headerBeginRefreshing];
    
}

- (void)refreshHeader
{
    // 请求数据
    [self requestStatusInfo];
}

- (void)refreshFooter
{
    
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
    // 和 MJRefresh 冲突
//    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.labelText = @"加载中...";
    
    Account * currentAccount = [AccountMgr sharedAccountMgr].currentAccount;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@?access_token=%@", kWeiboBaseURL, kStatusInfo, currentAccount.accessToken];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        _dataSource = [[PlainTableDataSource alloc]initWithTable:_tableView Items:responseObject[@"statuses"]];
        _tableView.dataSource = _dataSource;
        _tableView.delegate = _dataSource;
        [_tableView reloadData];
        
        // 停止刷新
        [_tableView headerEndRefreshing];
        
        [self showUpdateStatusCount];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark - 显示更新的微博数量
- (void)showUpdateStatusCount
{
    // 显示更新微博数量
    CGRect screenRect = [DQLCommonMethods screenBounds];
    UILabel * label = [[UILabel alloc]init];
    label.frame = (CGRect){CGPointZero, {screenRect.size.width, kNavigationBarHeight}};
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor orangeColor];
    label.text = @"更新了";
    
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, kNavigationBarHeight + kStatusBarHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
        
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
