//
//  RDConstants.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#ifndef RDConstants_h
#define RDConstants_h

#pragma mark - Endpoints

static NSString *const kDesignerDresssesEndpoint = @"http://static.sqvr.co/designer-dresses.json";
static NSString *const kDesignerAccessoriesEndpoint = @"http://static.sqvr.co/designer-accesories.json";
static NSString *const kRandomItemsEndpoint = @"http://static.sqvr.co/random-items.json";

#pragma mark - View Controller Identifiers

static NSString *const kProductViewControllerIdentifier = @"RDProductViewController";

#pragma mark - Storyboard Identifiers

static NSString *const kMainStoryboardIdentifier = @"Main";

#pragma mark - Cell Identifiers

static NSString *const kRDProductDetailCellIdentifier = @"RDProductDetailCell";
static NSString *const kRDDesignerCellIdentifier = @"RDDesignerCell";
static NSString *const kRDProductImageCellIdentifier = @"RDProductImageCell";

#endif /* RDConstants_h */
