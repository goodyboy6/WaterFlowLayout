//
//  DetailViewController.m
//  AsyncDisplayKitDemo
//
//  Created by yixiaoluo on 16/1/21.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "DetailViewController.h"
#import "ASDCollectionViewCell.h"
#import "ASDCollectionViewModel.h"
#import "ASDWaterFlowLayout.h"

static NSString *ASDCollectionViewCellID = @"com.alibaba.ASDCollectionViewCellID";

@interface DetailViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) ASDCollectionViewModel *viewModel;

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
    
    ASDWaterFlowLayout *layout = [ASDWaterFlowLayout new];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ASDCollectionViewCell class] forCellWithReuseIdentifier:ASDCollectionViewCellID];
    
    [self.view addSubview:self.collectionView];
    
    self.viewModel = [ASDCollectionViewModel withImageUrl:@"http://ww2.sinaimg.cn/mw600/66b3de17gw1f03ob7ipdbj20nq0zk76y.jpg"
                                                    title:@"妹子图"
                                                     desc:@"asndlasdlasndlasndlansdknsadlansdnlsandlasndlasnd"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
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

#pragma mark - collection view datasource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ASDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ASDCollectionViewCellID forIndexPath:indexPath];
    
    [cell configCellWithModel:self.viewModel];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

@end
