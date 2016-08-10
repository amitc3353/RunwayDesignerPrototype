//
//  ViewController.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/3/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDMainViewController.h"
#import "RDRequestManager.h"
#import "RDProductViewController.h"
#import "RDDesignerCell.h"
#import "RDConstants.h"
#import "RDDesignerRealm.h"
#import "UIViewController+UIAlertController.h"

@interface RDMainViewController () <RDDesignerCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *dataTableView;
@property (nonatomic, strong) RLMResults <RDDesignerRealm *> *designerData;
@property (nonatomic, strong) NSArray <RDRandomItem *> *randomItems;

@end

@implementation RDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupDesignerData];
    [self setupRandomItemsData];
}

#pragma mark - Private methods

- (void)setupTableView {
    [self.dataTableView registerNib:[UINib nibWithNibName:kRDDesignerCellIdentifier bundle:nil] forCellReuseIdentifier:kRDDesignerCellIdentifier];
}

- (void)setupDesignerData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [[RDRequestManager sharedManager] fetchDesignersForDresses:^(NSArray <NSString *> *designers, NSError *error) {
        [designers sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        for(NSString *designer in designers) {
            if(![self checkIfAlreadyExists:designer]) {
                RDDesignerRealm *designerModel = [RDDesignerRealm new];
                designerModel.designerName = designer;
                designerModel.isSaved = NO;
                [self addObjectToRealm:realm designerModel:designerModel];
            }
        }
    }];
    
    [[RDRequestManager sharedManager] fetchDesignersForAccessories:^(NSArray <NSString *> *designers, NSError *error) {
        [designers sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        for(NSString *designer in designers) {
            if(![self checkIfAlreadyExists:designer]) {
                RDDesignerRealm *designerModel = [RDDesignerRealm new];
                designerModel.designerName = designer;
                designerModel.isSaved = NO;
                [self addObjectToRealm:realm designerModel:designerModel];
            }
        }
        
        self.designerData = [[RDDesignerRealm allObjectsInRealm:realm] sortedResultsUsingProperty:@"designerName" ascending:YES];
        if(self.designerData && self.designerData.count > 0) {
            [self.dataTableView reloadData];
        }
    }];
}

- (void)setupRandomItemsData {
    [[RDRequestManager sharedManager] fetchRandomItems:^(NSArray <RDRandomItem *> *items, NSError *error) {
        self.randomItems = items;
    }];
}

#pragma mark - UITableview Datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.designerData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RDDesignerCell *cell = (RDDesignerCell *)[tableView dequeueReusableCellWithIdentifier:kRDDesignerCellIdentifier];

    cell.delegate = self;
    [cell layoutDesignerCellWithItem:self.designerData[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    BOOL didFindDetails = NO;
    RDDesignerRealm *designer = self.designerData[indexPath.row];
    for(RDRandomItem *item in self.randomItems) {
        if([item.designer isEqualToString:designer.designerName]) {
            RDProductViewController *productController = [RDProductViewController instantiateFromStoryboard];
            productController.item = item;
            didFindDetails = YES;
            [self.navigationController pushViewController:productController animated:YES];
        }
    }
    if(!didFindDetails) {
        [self showAlertWithTitle:@"Oops!" message:@"No Additional Info found!"];
    }
}

#pragma mark - RDDesignerCell Delegate methods

- (void)designerCellDidTapSave:(RDDesignerCell *)cell {
    NSIndexPath *indexPath = [self.dataTableView indexPathForCell:cell];
    RDDesignerRealm *designer = self.designerData[indexPath.row];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [self updateSavedStateForDesignerObjectInRealm:realm designerModel:designer];
}

#pragma mark - Realm update methods

- (void)addObjectToRealm:(RLMRealm *)realm designerModel:(RDDesignerRealm *)designer {
    [realm transactionWithBlock:^{
        [realm addObject:designer];
    }];
}

- (void)updateSavedStateForDesignerObjectInRealm:(RLMRealm *)realm designerModel:(RDDesignerRealm *)designer {
    [realm beginWriteTransaction];
    designer.isSaved = !designer.isSaved;
    [realm commitWriteTransaction];
}

- (BOOL)checkIfAlreadyExists:(NSString *)designerName {
    BOOL doesExist = NO;
    RDDesignerRealm *designerRealm = [RDDesignerRealm objectForPrimaryKey:designerName];
    
    if(designerRealm) {
        doesExist = YES;
    }
    return doesExist;
}

@end
