//
//  HomeViewController.m
//  weibo
//
//  Created by dingql on 14-8-8.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

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
    
    self.title = @"首页";
    
    CGSize size = CGSizeMake(50, 30);
    UIBarButtonItem * leftBarItem = [UIBarButtonItem barButtonWithNormalImage:@"navigationbar_compose.png" size:size target:self action:@selector(writeWeibo)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem * rightBarItem = [UIBarButtonItem barButtonWithNormalImage:@"navigationbar_pop.png" size:size target:self action:@selector(popUpMenu)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)writeWeibo
{
    NSLog(@"发微博");
}

- (void)popUpMenu
{
    NSLog(@"弹出菜单");
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
