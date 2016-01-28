//
//  WFWaterFlowLayout.h
//  WaterFlowDemo
//
//  Created by yixiaoluo on 16/1/22.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFWaterFlowLayout;
@protocol WFWaterFlowLayoutDelegate <NSObject>

@optional
- (CGRect)waterFlowLayout:(WFWaterFlowLayout *)layout boundsAtIndexPath:(NSIndexPath *)indexPath;//cell bounds at indexpath

@end


@interface WFWaterFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<WFWaterFlowLayoutDelegate> delegate;

@property (nonatomic) NSInteger numberOfColumns;//number of column. Default is 1

- (void)clearFrameCache;//all the cell frames by index path will be cached, so when the frame of some index path changed, you must call this method to clean the record. for example, datasource changed when you pull down refresh.

@end
