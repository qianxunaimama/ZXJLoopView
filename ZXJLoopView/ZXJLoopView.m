//
//  ZXJLoopView.m
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/26.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ZXJLoopView.h"
#import "ZXJCell.h"

@interface ZXJLoopView()

//属性一般没有下划线
@property(copy,nonatomic)completeDragCallBack callBack;
@property (strong, nonatomic)  NSArray *pictureNameArray;
@property (assign, nonatomic)  NSInteger realArrayIndex ;

@end
@implementation ZXJLoopView


-(instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)array andDidSeletdIndex:(completeDragCallBack)seletdIndex{
    //1.设置frame
    if (self = [super initWithFrame:frame]) {
        //2.数据源
        self.pictureNameArray = array;
        
        self.callBack = [seletdIndex copy];
        
    }
    return  self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(self.frame.size.width, 150);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *loopCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,
                                                                                             0,
                                                                                             self.frame.size.width,
                                                                                             150)
                                                             collectionViewLayout:flowLayout];
    [self addSubview:loopCollectionView];
    
    [loopCollectionView setDataSource:(id<UICollectionViewDataSource> _Nullable)self];
    [loopCollectionView setDelegate:(id<UICollectionViewDelegate> _Nullable)self];
    [loopCollectionView setBounces:NO];//弹簧效果
    [loopCollectionView setShowsHorizontalScrollIndicator:NO];//滚动条
    [loopCollectionView setPagingEnabled:YES];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:self.pictureNameArray.count * 100 /2];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1
                                                 inSection:0];
    [loopCollectionView scrollToItemAtIndexPath:indexPath
                               atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                       animated:YES];
    [loopCollectionView registerClass:[ZXJCell class] forCellWithReuseIdentifier:reuseId];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //    return self.pictureNameArray.count * 100;
    NSAssert(self.pictureNameArray.count  > 2, @"imageGroup content mistake");
    return self.pictureNameArray.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //计算将要显示的cell的值
    NSInteger index = (self.realArrayIndex + indexPath.item - 1 + self.pictureNameArray.count) % self.pictureNameArray.count;
    ZXJCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];
    [cell setImageName:self.pictureNameArray[index]];
    //    NSLog(@"---%s ",__FUNCTION__);//打印方法名
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"---%s ",__FUNCTION__);//打印方法名
    //2.计算当前值
    NSInteger realIndex = collectionView.contentOffset.x /collectionView.frame.size.width;
    NSLog(@"==== realArrayIndex is  befo %tu",self.realArrayIndex);
    self.realArrayIndex =  (self.realArrayIndex + realIndex - 1 + self.pictureNameArray.count) % self.pictureNameArray.count;
    NSLog(@"==== realArrayIndex is  %tu",self.realArrayIndex);
    
    //1.滚动到正确的位置
    indexPath = [NSIndexPath indexPathForItem:1
                                    inSection:0];
    [collectionView scrollToItemAtIndexPath:indexPath
                           atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                   animated:NO];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.callBack) {
        self.callBack(self.realArrayIndex );
    }
    
}
@end
