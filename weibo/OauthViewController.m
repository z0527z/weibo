//
//  OauthViewController.m
//  weibo
//
//  Created by dingql on 14-8-11.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "OauthViewController.h"
#import "Account.h"

@interface OauthViewController ()<UIWebViewDelegate>
{
    UIWebView * _webView;
}
@end

@implementation OauthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    CGRect rect = [DQLCommonMethods screenBounds];
    _webView = [[UIWebView alloc]initWithFrame:rect];
    _webView.delegate = self;
    self.view = _webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    NSURL * URL = [NSURL URLWithString:kOauthURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:request];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //NSLog(@"%@", request.URL);
    NSString * requestStr = [NSString stringWithFormat:@"%@", request.URL];
    
    // 截取出 access_token
    NSRange range = [requestStr rangeOfString:@"access_token=[^&]{1,}" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound)
    {
        Account * account = [[Account alloc]init];
        
        NSString * str = [requestStr substringWithRange:range];
        NSArray * array = [str componentsSeparatedByString:@"="];
        account.accessToken = array[1];
        
        // 截取有效期 expires_in=67282
        range = [requestStr rangeOfString:@"expires_in=[^&]+" options:NSRegularExpressionSearch];
        if (range.location != NSNotFound) {
            NSString * str = [requestStr substringWithRange:range];
            NSArray * array = [str componentsSeparatedByString:@"="];
            account.expiresIn = array[1];
        }
        
        // 截取用户uid uid=3913129041
        range = [requestStr rangeOfString:@"uid=[^&]+" options:NSRegularExpressionSearch];
        if (range.location != NSNotFound) {
            NSString * str = [requestStr substringWithRange:range];
            NSArray * array = [str componentsSeparatedByString:@"="];
            account.uid = array[1];
        }
        
        // 获取用户昵称
        
        
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:webView animated:YES];
    hud.labelText = @"加载中...";
    
    [UIApplication sharedApplication].NetworkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:webView animated:YES];
    [UIApplication sharedApplication].NetworkActivityIndicatorVisible = NO;
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
