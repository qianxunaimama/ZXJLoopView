//
//  ZXJLoopView.h
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/26.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import <UIKit/UIKit.h>

//传入传出参数 --index
typedef void(^completeDragCallBack)(NSInteger index);

@interface ZXJLoopView : UIView

//两进一出 
-(instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)array andDidSeletdIndex:(completeDragCallBack)seletdIndex;
@end
