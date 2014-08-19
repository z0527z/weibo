//
//  OauthViewController.m
//  weibo
//
//  Created by dingql on 14-8-11.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "OauthViewController.h"
#import "Account.h"
#import "AccountMgr.h"
#import "WeiboSDK.h"

@interface OauthViewController ()<WeiboSDKDelegate>

@end

@implementation OauthViewController

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
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    Account * currentAccount = [AccountMgr sharedAccountMgr].currentAccount;
    
    // 有授权时直接切到主界面
    if (currentAccount) {
        self.accessOK();
    }
    else{ // 无授权时加载授权界面
        
        // 只能放在此处，否则会无法点击
        [self weiboPressed];
    }
}

- (void)weiboPressed
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kWeiboRedirectURI;
    request.scope = @"all";
//  request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
//                         @"Other_Info_1": [NSNumber numberWithInt:123],
//                         @"Other_Info_2": @[@"obj1", @"obj2"],
//                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
        NSLog(@"---->");
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *title = @"发送结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
//        NSString *title = @"认证结果";
//        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];

        // 保存账号信息
        Account * account = [[Account alloc]init];
        account.accessToken = [(WBAuthorizeResponse *)response accessToken];
        account.uid = [(WBAuthorizeResponse *)response userID];
        account.expiresIn = [NSString stringWithFormat:@"%@",[(WBAuthorizeResponse *)response expirationDate]];
        
        // 请求账号信息
        [self requestUserInfo:account];
        
    }
}

#pragma mark - 获取用户信息并归档
- (void)requestUserInfo:(Account *)account
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@?access_token=%@&uid=%@", kWeiboBaseURL, kUserInfo, account.accessToken, account.uid];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        account.screenName = responseObject[@"screen_name"];
        
        // 归档账号信息
        [[AccountMgr sharedAccountMgr]addAccount:account];
        [[AccountMgr sharedAccountMgr] saveAccounts];
        
        // 切换到主界面
        self.accessOK();
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
