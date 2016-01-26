//
//  ASDCollectionViewModel.m
//  AsyncDisplayKitDemo
//
//  Created by yixiaoluo on 16/1/21.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "ASDCollectionViewModel.h"

@implementation ASDCollectionViewModel

+ (instancetype)withImageUrl:(NSString *)imageUrl title:(NSString *)title desc:(NSString *)desc
{
    ASDCollectionViewModel *viewModel = [ASDCollectionViewModel new];
    viewModel.imageUrl = imageUrl;
    viewModel.title = title;
    viewModel.desc = desc;

    return viewModel;
}

@end
