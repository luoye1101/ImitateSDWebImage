//
//  DownloadOperation.m
//  ImitateSDWebImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "DownloadOperation.h"

@interface DownloadOperation ()


/**
 *  接收控制器传入的地址
 */
@property(copy, nonatomic) NSString *URLString;

/**
 *  接收控制器传入的下载完成后的回调
 */
@property(copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end

@implementation DownloadOperation

//重新main方法
- (void)main {
    
    NSLog(@"传入 %@", self.URLString);
    
    //1. 下载图片
    NSURL *url = [NSURL URLWithString:self.URLString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        NSLog(@"%@ -- %@", image, [NSThread currentThread]);
        
        self.finishedBlock(image);
        
    }];
    
}


+ (instancetype)downloadWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock {
    
    DownloadOperation *op = [[DownloadOperation alloc] init];
    
    op.URLString = URLString;
    
    op.finishedBlock = finishedBlock;
    
    return op;
    
    
}


@end







