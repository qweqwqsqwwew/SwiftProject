//
//  ViewController.m
//  HJGPodDemo
//
//  Created by Developer on 2018/4/6.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "ViewController.h"
#import "HJGPodDemo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HJGPodDemo *demo = [[HJGPodDemo alloc]init];
    [demo fuckPod];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
