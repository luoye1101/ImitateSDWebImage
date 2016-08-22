//
//  DownloadOperation.h
//  ImitateSDWebImage
//
//  Created by 黄跃奇 on 16/8/22.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadOperation : NSOperation



+ (instancetype)downloadWithURLString:(NSString *)URLString finishedBlock:(void(^)(UIImage *))finishedBlock;


@end







