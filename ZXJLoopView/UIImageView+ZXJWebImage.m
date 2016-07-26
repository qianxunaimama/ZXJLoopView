//
//  UIImageView+ZXJWebImage.m
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/26.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#import "UIImageView+ZXJWebImage.h"
#import <objc/runtime.h>




static char kImgURLKey;

@implementation UIImageView (ZXJWebImage)


-(void)zxj_setImageWithUrl:(NSString *)imgUrl{
    //
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imgUrl]cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:10.0];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                            dispatch_main_async_safe(^{
                                                NSLog(@"====current %@",[NSThread currentThread]);
                                                if (error == nil) {
                                                    UIImage *image = [UIImage imageWithData:data];
                                                    
                                                    [self setImage:image]; //imageview的分类
                                                    
                                                }
                                                
                                                
                                            });
                                        }];
    [task resume];//启动task
    
    
}

#pragma mark - imgURL
-(void)setImgURL:(NSString *)imgURL
{
    objc_setAssociatedObject(self, &kImgURLKey, imgURL, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)imgURL
{
    return objc_getAssociatedObject(self, &kImgURLKey);
}

@end
