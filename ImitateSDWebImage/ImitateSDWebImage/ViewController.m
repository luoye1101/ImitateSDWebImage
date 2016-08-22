//
//  ViewController.m
//  ImitateSDWebImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    //定义全局队列
    NSOperationQueue *_queue;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //实例化全局队列
    _queue = [[NSOperationQueue alloc] init];
    
    //图片地址
    NSString *URLString = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    
    //创建自定义操作对象
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        
        //回主线程刷新UI
        NSLog(@"%@ -- %@", image, [NSThread currentThread]);
        
    }];
    
    
    //将操作添加到队列
    [_queue addOperation:op];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end









