//
//  MainViewController.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "MainViewController.h"
#import "Dock.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "MoreViewController.h"

@interface MainViewController ()
{
    Dock * _dock;
    UIViewController * _currentViewController;
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

#pragma mark - 创建控制器
- (UIViewController *)createViewControllerWithName:(Class)VCName
{
    
    UIViewController * VC = [VCName new];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];
    
    return nav;
}

- (void)createControllers
{
    UIViewController * home = [self createViewControllerWithName:[HomeViewController class]];
    [self addChildViewController:home];
    
    UIViewController * message = [self createViewControllerWithName:[MessageViewController class]];
    [self addChildViewController:message];
    
    UIViewController * profile = [self createViewControllerWithName:[ProfileViewController class]];
    [self addChildViewController:profile];
    
    UIViewController * discover = [self createViewControllerWithName:[DiscoverViewController class]];
    [self addChildViewController:discover];
    
    UIViewController * more = [self createViewControllerWithName:[MoreViewController class]];
    [self addChildViewController:more];

}

#pragma mark - 创建Dock
- (void)createDock
{
    // IOS7下状态栏的显示方案已经改变
    CGRect rect = self.view.bounds;
    
    _dock = [[Dock alloc]initWithFrame:CGRectMake(0, rect.size.height - kDockHeight, rect.size.width, kDockHeight)];
    [self.view addSubview:_dock];
    
    DockItem * item1 = [DockItem DockItemWithText:@"首页" Icon:@"tabbar_home.png"];
    DockItem * item2 = [DockItem DockItemWithText:@"消息" Icon:@"tabbar_message_center.png"];
    DockItem * item3 = [DockItem DockItemWithText:@"我" Icon:@"tabbar_profile.png"];
    DockItem * item4 = [DockItem DockItemWithText:@"搜索" Icon:@"tabbar_discover.png"];
    DockItem * item5 = [DockItem DockItemWithText:@"其他" Icon:@"tabbar_more.png"];
    
    [_dock addItemsWithArray:@[item1, item2, item3, item4, item5]];
    
    // 避免 retain 环, 标准做法
    // 1. __block MainViewController * tmpVC = self;
    __weak typeof(self) weak_self = self;
     _dock.clickedBlock = ^(int index){
         if (weak_self) {
             __strong typeof(weak_self) strong_self = weak_self;
             [strong_self selectControllerAtIndex:index];
         }
         else{
             
         }
    };
}

- (void) selectControllerAtIndex:(int )index
{
    UIViewController * VC = self.childViewControllers[index];
    
    if (_currentViewController == VC) return;
    // 裁剪要添加的 Controller 的 View 的大小，以适应添加到主控制器上的显示需要
    CGRect rect = self.view.bounds;
    VC.view.frame = CGRectMake(0, 0, rect.size.width, rect.size.height - kDockHeight);
    
    //NSLog(@"height:%f, %@", rect.size.height - kDockHeight,  NSStringFromCGRect(VC.navigationController.navigationBar.bounds));
    // 移除当前的View，添加新的view
    [_currentViewController.view removeFromSuperview];
    
    [self.view addSubview:VC.view];
    _currentViewController = VC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createDock];
    [self createControllers];
    [self selectControllerAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
