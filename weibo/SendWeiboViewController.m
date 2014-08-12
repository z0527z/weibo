//
//  SendWeiboViewController.m
//  weibo
//
//  Created by dingql on 14-8-10.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "SendWeiboViewController.h"

@interface SendWeiboViewController ()

@end

@implementation SendWeiboViewController

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
    
    self.title = @"发微博";
    CGSize size = CGSizeMake(60, 30);
    UIBarButtonItem * leftBarItem = [UIBarButtonItem barButtonWithBg:@"navigationbar_button_background.png" title:@"取消" size:size target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem * rightBarItem = [UIBarButtonItem barButtonWithBg:@"compose_emotion_table_send.png" title:@"发送" size:size target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)cancel
{
    NSLog(@"取消");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send
{
    NSLog(@"发送");
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
