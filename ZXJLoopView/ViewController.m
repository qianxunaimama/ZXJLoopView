//
//  ViewController.m
//  ZXJLoopView
//
//  Created by 张信娟 on 16/7/22.
//  Copyright © 2016年 张信娟. All rights reserved.
//

#import "ViewController.h"
#import "ZXJCell.h"

@interface ViewController ()

@property (strong, nonatomic)  NSArray *pictureNameArray;

@end


@implementation ViewController


-(NSArray *)pictureNameArray{
    if (_pictureNameArray == nil) {
        _pictureNameArray = @[@"1",@"2",@"3"];
    }
    return _pictureNameArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 150);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    UICollectionView *loopCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,
                                                                                             0,
                                                                                             self.view.frame.size.width,
                                                                                             150)
                                                             collectionViewLayout:flowLayout];
    [self.view addSubview:loopCollectionView];
    
    [loopCollectionView setDataSource:(id<UICollectionViewDataSource> _Nullable)self];
    [loopCollectionView setDelegate:(id<UICollectionViewDelegate> _Nullable)self];
    [loopCollectionView setBounces:NO];//弹簧效果
    [loopCollectionView setShowsHorizontalScrollIndicator:NO];//滚动条
    [loopCollectionView setPagingEnabled:YES];
//    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:self.pictureNameArray.count * 100 /2];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.pictureNameArray.count * 100 /2
                                                 inSection:0];
    [loopCollectionView scrollToItemAtIndexPath:indexPath
                               atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                       animated:YES];
    [loopCollectionView registerClass:[ZXJCell class] forCellWithReuseIdentifier:reuseId];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.pictureNameArray.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZXJCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];
    [cell setImageName:self.pictureNameArray[indexPath.item % self.pictureNameArray.count]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
