//
//  NewFeatureViewController.m
//  weibo
//
//  Created by dingql on 14-8-4.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "UIImage+newFeature.h"
#import "MainViewController.h"

#define kCount 4

@interface NewFeatureViewController ()<UIScrollViewDelegate>
{
    UIPageControl * _pageControl;
}
@end

@implementation NewFeatureViewController

- (void)loadView
{
    // 将控制器的视图定制为 UIImageView
    UIImage * image = [UIImage fullScreenImageWithImageName:@"new_feature_background.png"];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    CGSize screenSize = [DQLCommonMethods screenBounds].size;
    imageView.bounds = (CGRect){CGPointZero, screenSize};
    self.view = imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    
    CGRect rect = [DQLCommonMethods screenBounds];
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:rect];
    scrollView.contentSize = CGSizeMake(kCount * rect.size.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < kCount; i ++) {
        [self addImageWithIndex:i inView:scrollView];
    }
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.95);
    _pageControl.bounds = (CGRect){CGPointZero, {100, 0}};
    _pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point.png"]];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point.png"]];
    _pageControl.numberOfPages = kCount;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
}

#pragma - 添加图片
- (void)addImageWithIndex:(int)index inView:(UIView *)view
{
    CGRect rect = [DQLCommonMethods screenBounds];
    NSString * str = [NSString stringWithFormat:@"new_feature_%d.png", index + 1];
    UIImage * image = [UIImage fullScreenImageWithImageName:str];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = (CGRect){{index * rect.size.width, 0}, rect.size};
    [view addSubview:imageView];
    
    if (index == kCount - 1) {
        NSLog(@"index:%d", index);
        [self addBtnInView:imageView];
    }
}

- (void)addBtnInView:(UIView *)view
{
    // 添加进入按钮
    view.userInteractionEnabled = YES;
    CGRect rect = [DQLCommonMethods screenBounds];
    UIButton * enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * image = [UIImage imageNamed:@"new_feature_finish_button.png"];
    enterBtn.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.85);
    enterBtn.bounds = (CGRect){CGPointZero, image.size};
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button.png"] forState:UIControlStateNormal];
    [enterBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
    [enterBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:enterBtn];
    
    // 添加分享按钮
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    image = [UIImage imageNamed:@"new_feature_share_false.png"];
    shareBtn.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.75);
    shareBtn.bounds = (CGRect){CGPointZero, image.size};
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_share_true.png"] forState:UIControlStateSelected];
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.adjustsImageWhenHighlighted = NO;
    shareBtn.selected = YES;
    [view addSubview:shareBtn];
}

#pragma - 进入按钮事件处理
- (void)enter
{
    MainViewController * mainVC = [[MainViewController alloc]init];
    // 这种方式能实现动画
    mainVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    mainVC.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:mainVC animated:YES completion:^{
        [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
        
    }];
    
    // 这种方式不能实现动画
    //self.view.window.rootViewController = mainVC;
}

#pragma - 分享按钮事件处理
- (void)share:(UIButton *)btn
{
    btn.selected = !btn.isSelected;
}

#pragma - UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"--->new");
}

@end
