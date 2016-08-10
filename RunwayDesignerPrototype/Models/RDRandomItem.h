//
//  RandomItem.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDRandomItemImage.h"

@interface RDRandomItem : NSObject

@property (nonatomic, strong) NSString *styleName;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *productDetail;
@property (nonatomic, strong) NSString *designer;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fitNotes;
@property (nonatomic, strong) NSString *styleNotes;
@property (nonatomic, strong) NSDictionary *imagesBySize;
@property (nonatomic, assign) NSInteger rentalFee8Day;
@property (nonatomic, assign) NSInteger rentalFee;
@property (nonatomic, assign) BOOL clearance;

@property (nonatomic, strong) RDRandomItemImage *itemImage;

@end
