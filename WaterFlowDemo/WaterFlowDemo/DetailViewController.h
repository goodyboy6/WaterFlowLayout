//
//  DetailViewController.h
//  WaterFlowDemo
//
//  Created by yixiaoluo on 16/1/26.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

