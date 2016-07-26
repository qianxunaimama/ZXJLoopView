//
//  ViewController.m
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/22.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ViewController.h"
#import "ZXJLoopView.h"



@interface ViewController ()

@property (strong, nonatomic)  NSArray *pictureNameArray;
@property (assign, nonatomic)  NSInteger realArrayIndex ;

@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect loopViewRect = CGRectMake(0, 0, self.view.frame.size.width, 150);
    
    ZXJLoopView  *loopView = [[ZXJLoopView alloc]initWithFrame:loopViewRect andDataArray:self.pictureNameArray andDidSeletdIndex:^(NSInteger index) {
        NSLog(@"===被选中的cell是  %tu",index);
    }];
    
    [self.view addSubview:loopView];
    
    
}
-(NSArray *)pictureNameArray{
    if (_pictureNameArray == nil) {
        _pictureNameArray = @[@"1",@"2",@"3"];
    }
    return _pictureNameArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
