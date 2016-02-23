//
//  WFWaterFlowLayout.m
//  WaterFlowDemo
//
//  Created by yixiaoluo on 16/1/22.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "WFWaterFlowLayout.h"
#import <objc/message.h>

@interface WFWaterFlowLayout ()

@property NSMutableArray<NSNumber *> *bottoms;//记录各列最大值
@property NSMutableDictionary *frameDictionary;//记录历史cell的位置，key为indexPath

@end

static CGFloat itemPadding = 10;
@implementation WFWaterFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frameDictionary = [NSMutableDictionary dictionary];
        self.bottoms = [NSMutableArray array];
        
        self.numberOfColumns = 1;
        
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = itemPadding;
        self.minimumLineSpacing = itemPadding;
        self.sectionInset = UIEdgeInsetsMake(itemPadding, itemPadding, itemPadding, itemPadding);
    }
    return self;
}

- (void)setNumberOfColumns:(NSInteger)numberOfColumns
{
    NSAssert(numberOfColumns!=0, nil);
    
    _numberOfColumns = numberOfColumns;
    [self resetBottoms];
}

- (void)clearFrameCache
{
    [self resetBottoms];
    [self.frameDictionary removeAllObjects];
    
    [self.collectionView reloadData];
}

- (void)resetBottoms
{
    [self.bottoms removeAllObjects];
    for (NSInteger i=0; i<self.numberOfColumns; i++) {
        self.bottoms[i] = @(self.sectionInset.top);
    }
}

#pragma mark - overwrite
- (CGSize)collectionViewContentSize
{
    __block CGFloat height = 0;
    [self getMaxBottomCompletion:^(CGFloat maxY, NSInteger column) {
        height = maxY;
    }];
    return CGSizeMake(self.collectionView.frame.size.width, height+self.sectionInset.bottom);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i=0; i<itemCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [array addObject:attributes];
        }
    }
    
    return array;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = [self itemFrameAtIndexPath:indexPath];
    
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    //scrollview bounds wil change when scrolling: http://objccn.io/issue-3-2/
    BOOL invalidate = self.collectionView.bounds.size.width != newBounds.size.width;
    if (invalidate) {
        [self invalidateOldFrames];
    }
    return invalidate;
}

#pragma mark - private
- (void)invalidateOldFrames
{
    for (NSInteger i=0; i<self.numberOfColumns; i++) {
        self.bottoms[i] = @(self.sectionInset.top);
    }
    [self.frameDictionary removeAllObjects];
}

- (CGRect)randomBoundsAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        CGSize itemSize = ((CGSize (*)(id, SEL, UICollectionView *, UICollectionViewFlowLayout *, NSIndexPath *))objc_msgSend)(self.collectionView.delegate, @selector(collectionView:layout:sizeForItemAtIndexPath:) , self.collectionView, self, indexPath);
        return   (CGRect){.size = itemSize};
    }else{
        CGFloat width = (self.collectionView.frame.size.width-self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing*(self.numberOfColumns - 1))/self.numberOfColumns;
        return CGRectMake(0, 0, width, MAX(arc4random()*1.0/INT32_MAX*200, 80));
    }
}

- (NSString *)frameKeyAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"%li_%li", (long)indexPath.section, (long)indexPath.row];
}

- (void)getMaxBottomCompletion:(void(^)(CGFloat minY, NSInteger column))completion
{
    CGFloat minY = self.bottoms[0].floatValue;
    NSInteger column = 0;
    
    for (NSInteger i = 1; i<self.numberOfColumns; i++) {
        if (minY < self.bottoms[i].floatValue) {
            minY = self.bottoms[i].floatValue;
            column = i;
        }
    }
    
    if (completion) {
        completion(minY, column);
    }
}

- (void)getMinBottomCompletion:(void(^)(CGFloat minY, NSInteger column))completion
{
    CGFloat minY = self.bottoms[0].floatValue;
    NSInteger column = 0;
    
    for (NSInteger i = 1; i<self.numberOfColumns; i++) {
        if (minY > self.bottoms[i].floatValue) {
            minY = self.bottoms[i].floatValue;
            column = i;
        }
    }
    
    if (completion) {
        completion(minY, column);
    }
}

- (CGRect)itemFrameAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *frameKey = [self frameKeyAtIndexPath:indexPath];

    NSString *frameString = [self.frameDictionary objectForKey:frameKey];
    if (frameString) {
        return CGRectFromString(frameString);
    }
    
    __block CGRect f = [self randomBoundsAtIndexPath:indexPath];
    [self getMinBottomCompletion:^(CGFloat minY, NSInteger column) {
        f.origin.x = self.sectionInset.left + (self.minimumInteritemSpacing+f.size.width)*column;
        f.origin.y = minY + self.minimumLineSpacing;
        self.bottoms[column] = @(CGRectGetMaxY(f));
    }];

    [self.frameDictionary setObject:NSStringFromCGRect(f) forKey:frameKey];
    
    return f;
}
@end
