//
//  MainViewController.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "MainViewController.h"
#import "Dock.h"

@interface MainViewController ()
{
    Dock * _dock;
}
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // IOS7下状态栏的显示方案已经改变
    CGRect rect = self.view.bounds;
    NSLog(@"main-->bounds:%@", NSStringFromCGRect(self.view.bounds));
    
    _dock = [[Dock alloc]initWithFrame:CGRectMake(0, rect.size.height - kDockHeight, rect.size.width, kDockHeight)];
    [self.view addSubview:_dock];
    
    DockItem * item1 = [DockItem DockItemWithText:@"首页" Icon:@"tabbar_home.png"];
    DockItem * item2 = [DockItem DockItemWithText:@"消息" Icon:@"tabbar_message_center.png"];
    DockItem * item3 = [DockItem DockItemWithText:@"我" Icon:@"tabbar_profile.png"];
    DockItem * item4 = [DockItem DockItemWithText:@"搜索" Icon:@"tabbar_discover.png"];
    DockItem * item5 = [DockItem DockItemWithText:@"其他" Icon:@"tabbar_more.png"];
    
    [_dock addItemsWithArray:@[item1, item2, item3, item4, item5]];
    
    _dock.clickedBlock = ^(int index){
        NSLog(@"点击了第%d个按钮", index);
    };
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"--->");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
