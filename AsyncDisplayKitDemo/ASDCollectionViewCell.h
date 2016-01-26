//
//  ASDCollectionViewCell.h
//  AsyncDisplayKitDemo
//
//  Created by yixiaoluo on 16/1/21.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASDCollectionViewModel;
@interface ASDCollectionViewCell : UICollectionViewCell

- (void)configCellWithModel:(ASDCollectionViewModel *)model;

@end
