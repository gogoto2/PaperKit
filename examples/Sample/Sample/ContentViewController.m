//
//  ContentViewController.m
//  Sample
//
//  Created by Norikazu on 2015/06/27.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width/3, self.view.bounds.size.width/3);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[PKCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ContentViewCell"];
    
    CGRect rect = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(300, 20, 20, 20));
    
    _imageView = [[UIImageView alloc] initWithFrame:rect];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    _imageView.image = [UIImage imageNamed:@"pexels-photo-medium"];
    
    [self.view addSubview:_collectionView];
    [self.view addSubview:_imageView];
}

- (void)setTranstionProgress:(CGFloat)transtionProgress
{
    [super setTranstionProgress:transtionProgress];
    _imageView.alpha = transtionProgress;
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (nonnull UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContentViewCell" forIndexPath:indexPath];
    CGFloat color = floorf(indexPath.item)/[self collectionView:collectionView numberOfItemsInSection:indexPath.section];
    cell.backgroundColor = [UIColor colorWithHue:color saturation:1 brightness:1 alpha:1];
    return cell;
}

@end