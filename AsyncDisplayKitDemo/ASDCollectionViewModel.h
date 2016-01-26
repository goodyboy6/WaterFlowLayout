//
//  ASDCollectionViewModel.h
//  AsyncDisplayKitDemo
//
//  Created by yixiaoluo on 16/1/21.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASDCollectionViewModel : NSObject

@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;

+ (instancetype)withImageUrl:(NSString *)imageUrl title:(NSString *)title desc:(NSString *)desc;

@end
