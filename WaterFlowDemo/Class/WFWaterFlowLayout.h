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
- (CGRect)waterFlowLayout:(WFWaterFlowLayout *)layout boundsAtIndexPath:(NSIndexPath *)indexPath;//每个cell的bounds

@end

//http://objccn.io/issue-3-3/
@interface WFWaterFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<WFWaterFlowLayoutDelegate> delegate;

@property (nonatomic) NSInteger numberOfColumns;//列数

@end
