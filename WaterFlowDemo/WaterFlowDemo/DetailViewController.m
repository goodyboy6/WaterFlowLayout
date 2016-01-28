//
//  DetailViewController.m
//  WaterFlowDemo
//
//  Created by yixiaoluo on 16/1/26.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "DetailViewController.h"
#import "WFWaterFlowLayout.h"

static NSString *kWFCollectionViewCellID = @"com.alibaba.kWFCollectionViewCellID";

@interface DetailViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
WFWaterFlowLayoutDelegate
>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSMutableArray *dataSource;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    WFWaterFlowLayout *layout = [WFWaterFlowLayout new];
    layout.numberOfColumns = 2;
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kWFCollectionViewCellID];
    
    [self.view addSubview:self.collectionView];
    
    self.dataSource = [NSMutableArray array];
    UIColor *red = [UIColor redColor];
    for (NSInteger i = 0; i<100; i++) {
        [self.dataSource addObject:red];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addObject:)];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addObject:(id)sender
{
    [self.dataSource insertObject:[UIColor blueColor] atIndex:0];
    
    WFWaterFlowLayout *flowLayout = (WFWaterFlowLayout *)self.collectionView.collectionViewLayout;
    [flowLayout clearFrameCache];
}

#pragma mark -
- (CGRect)waterFlowLayout:(WFWaterFlowLayout *)layout boundsAtIndexPath:(NSIndexPath *)indexPath//每个cell的bounds
{
    WFWaterFlowLayout *flowLayout = (WFWaterFlowLayout *)self.collectionView.collectionViewLayout;
    
    CGFloat width = (self.collectionView.frame.size.width-flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing*(flowLayout.numberOfColumns - 1))/flowLayout.numberOfColumns;
    
    return CGRectMake(0, 0, width, MAX(arc4random()*1.0/INT32_MAX*200, 80));
}

#pragma mark - collection view datasource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kWFCollectionViewCellID forIndexPath:indexPath];
    
    UIColor *color = self.dataSource[indexPath.row];
    cell.contentView.backgroundColor = color;

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

@end
