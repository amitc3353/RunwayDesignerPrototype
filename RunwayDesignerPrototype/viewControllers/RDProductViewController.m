//
//  RDProductViewController.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "RDProductViewController.h"
#import "RDConstants.h"
#import "RDProductDetailCell.h"
#import "RDProductImageCell.h"
#import "UIViewController+BackButton.h"

static const NSInteger kNumberOfItemDetailCells = 4;
static const CGFloat kCellExpandedHeight = 180.f;
static const CGFloat kCellNormalHeight = 44.f;
static const CGFloat kCollectionViewCellHeight = 180.f;

@interface RDProductViewController ()

@property (nonatomic, weak) IBOutlet UILabel *itemName;
@property (nonatomic, weak) IBOutlet UILabel *designerName;
@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;
@property (nonatomic, weak) IBOutlet UITableView *detailsTableView;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSIndexPath *selectedRowIndex;
@property (nonatomic, strong) NSArray *imageURLs;

@end

@implementation RDProductViewController

+ (RDProductViewController *)instantiateFromStoryboard {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kMainStoryboardIdentifier bundle:nil];
    
    return [mainStoryboard instantiateViewControllerWithIdentifier:kProductViewControllerIdentifier];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayDataForItem];
    [self setupUIElements];
}

#pragma mark - Private methods

- (void)displayDataForItem {
    [self showBackButton];
    self.navigationItem.title = self.item.displayName;
    self.designerName.text = self.item.designer;
}

- (void)setupUIElements {
    [self.collectionView registerNib:[UINib nibWithNibName:kRDProductImageCellIdentifier bundle:nil]
          forCellWithReuseIdentifier:kRDProductImageCellIdentifier];
    [self.detailsTableView registerNib:[UINib nibWithNibName:kRDProductDetailCellIdentifier bundle:nil] forCellReuseIdentifier:kRDProductDetailCellIdentifier];
    self.imageURLs = self.item.itemImage.fullSizeURLs;
    self.pageControl.numberOfPages = self.imageURLs.count;
}

#pragma mark - UITableview datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfItemDetailCells;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    RDProductDetailCell *cell = (RDProductDetailCell *)[tableView dequeueReusableCellWithIdentifier:kRDProductDetailCellIdentifier];

    [cell layoutProductCellWithItem:self.item row:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(self.selectedRowIndex != indexPath) {
        self.selectedRowIndex = indexPath;
    } else {
        self.selectedRowIndex = nil;
    }
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.selectedRowIndex && indexPath.row == self.selectedRowIndex.row) {
        return kCellExpandedHeight;
    }
    return kCellNormalHeight;
}

#pragma mark - UICollectionview Datasource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RDProductImageCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:kRDProductImageCellIdentifier forIndexPath:indexPath];
    
    [cell.productImageView sd_setImageWithURL:[self.imageURLs objectAtIndex:indexPath.row]
                 placeholderImage:nil
                          options:SDWebImageRefreshCached];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, kCollectionViewCellHeight);
}

#pragma mark - UIScrollView Delegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
}

@end
