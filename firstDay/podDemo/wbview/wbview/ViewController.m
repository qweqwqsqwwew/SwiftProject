//
//  ViewController.m
//  wbview
//
//  Created by Developer on 2018/4/21.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    web.delegate = self;
    
    if(self.url.length == 0){
        self.url = @"https://609044.com/wangWangCPLoginWeb/app/home";
    }
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:web];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    if ([request.URL isEqual:[NSURL URLWithString:@"https://609044.com/wangWangCPLoginWeb/app/home"]]) {
//        return YES;
//    }
//    else {
//        ViewController *info = [[ViewController alloc] init];
//        info.url = [NSString stringWithContentsOfURL:request.URL encoding:NSUTF8StringEncoding error:nil];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:info];
//        [self presentViewController:nav animated:YES completion:nil];
//        return NO;
//    }
    
    if ([[NSString stringWithContentsOfURL:request.URL encoding:NSUTF8StringEncoding error:nil] containsString:@"about:blank"]) {
                ViewController *info = [[ViewController alloc] init];
                info.url = [NSString stringWithContentsOfURL:request.URL encoding:NSUTF8StringEncoding error:nil];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:info];
                [self presentViewController:nav animated:YES completion:nil];
                return NO;
    }else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ------开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
// ------结束加载
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
// ------请求失败
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    if ([[NSString stringWithFormat:@"%@",error.userInfo[@"NSErrorFailingURLKey"]] containsString:@"?l="]) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",error.userInfo[@"NSErrorFailingURLKey"]]] options:nil completionHandler:nil];
//    }
//}


@end
