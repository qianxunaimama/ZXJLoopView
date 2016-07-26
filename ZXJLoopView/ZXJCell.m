//
//  ZXJCell.m
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/22.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ZXJCell.h"
#import "UIImageView+ZXJWebImage.h"

@interface ZXJCell()

@property (strong, nonatomic)  UIImageView *imageView;

@end

NSString *const reuseId = @"loopCell" ;

@implementation ZXJCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    NSLog(@"---%s ",__FUNCTION__);//打印方法名
    
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView addSubview:self.imageView];
    
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        
    }
    return _imageView;
}
-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) { //非空，是本地图片
        [self.imageView setImage:image];
    }else{
        //为空，说明imageName 传入的是url.
        [self.imageView zxj_setImageWithUrl:imageName];
    }
    
}

@end
