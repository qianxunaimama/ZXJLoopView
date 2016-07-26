# ZXJLoopView
###轮播图

1. 支持本地图片和url混合投入
2. 支持内存和硬盘缓存


###How to use it
`````
import "ZXJLoopView.h"
ZXJLoopView  *loopView = [[ZXJLoopView alloc]initWithFrame:loopViewRect andDataArray:self.pictureNameArray andDidSeletdIndex:^(NSInteger index) {
        NSLog(@"===被选中的cell是  %tu",index);
    }];
`````
  