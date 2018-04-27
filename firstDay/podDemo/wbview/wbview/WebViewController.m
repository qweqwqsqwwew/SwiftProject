//
//  WebViewController.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/9/8.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  广告详情页

#import "WebViewController.h"
#import <WebKit/WebKit.h>
//#import "XHLaunchAd.h"

@interface WebViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong)WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation WebViewController

-(void)dealloc
{
    /**
     如果你设置了APP从后台恢复时也显示广告,
     当用户停留在广告详情页时,APP从后台恢复时,你不想再次显示启动广告,
     请在广告详情控制器销毁时,发下面通知,告诉XHLaunchAd,广告详情页面已显示完
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"" object:nil];
    
//    DLog(@"webview控制器销毁");
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /**
     如果你设置了APP从后台恢复时也显示广告,
     当用户停留在广告详情页时,APP从后台恢复时,你不想再次显示启动广告,
     请在广告详情控制器将要显示时,发下面通知,告诉XHLaunchAd,广告详情页面将要显示
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"←" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"leftpoint"] forState:UIControlStateNormal];
//    button.size = CGSizeMake(W(80), H(22));
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, W(61));
    
    
    
//    [[button.widthAnchor constraintEqualToConstant:W(80)] setActive:YES];
//    [[button.heightAnchor constraintEqualToConstant:H(22)] setActive:YES];
    
//    if (IOS9_OR_LATER) {
//        [[button.widthAnchor constraintEqualToConstant:W(80)] setActive:YES];
//        [[button.heightAnchor constraintEqualToConstant:H(22)] setActive:YES];
//    }
    
    // 让按钮内部的所有内容左对齐
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 84, self.view.bounds.size.width, self.view.bounds.size.height-84)];
    self.webView.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    if(!self.URLString){
        self.URLString = @"https://609044.com/wangWangCPLoginWeb/app/home";
    };
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:(self.URLString)]];
    [self.webView loadRequest:request];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 84, self.view.bounds.size.width, 2)];
    self.progressView.progressViewStyle = UIProgressViewStyleBar;
    self.progressView.progressTintColor = [UIColor blackColor];
    [self.navigationController.view addSubview:self.progressView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.progressView removeFromSuperview];
}
-(void)back{
    
    if([_webView canGoBack])
    {
        [_webView goBack];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        CGFloat progress = [change[NSKeyValueChangeNewKey] floatValue];
        [self.progressView setProgress:progress animated:YES];
        if(progress == 1.0)
        {
//            @weakify_self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                @strongify_self;
                [self.progressView setProgress:0.0 animated:NO];
            });
        }
        
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //如果是跳转一个新页面
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


@end
