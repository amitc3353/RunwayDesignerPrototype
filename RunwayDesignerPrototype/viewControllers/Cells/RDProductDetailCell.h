//
//  ProductDetailCell.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDRandomItem.h"

typedef NS_ENUM(NSInteger, RowType) {
    RowTypeItemDetails,
    RowTypeItemNotes,
    RowTypeItemPrice,
    RowTypeItemAdditionalInfo
};

@interface RDProductDetailCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *headerLabel;
@property (nonatomic, weak) IBOutlet UILabel *firstDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *secondDescriptionLabel;

- (void)layoutProductCellWithItem:(RDRandomItem *)item row:(NSInteger)row;

@end
