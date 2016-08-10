//
//  ProductDetailCell.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDProductDetailCell.h"

@implementation RDProductDetailCell

- (void)layoutProductCellWithItem:(RDRandomItem *)item row:(NSInteger)row {
    switch (row) {
        case RowTypeItemDetails:
            
            self.headerLabel.text = @"Item Details :";
            self.firstDescriptionLabel.text = item.productDetail?[NSString stringWithFormat:@"Product details : %@",item.productDetail]:@"Product details : N/A";
            self.secondDescriptionLabel.text = item.type?[NSString stringWithFormat:@"Type : %@", item.type]:@"Type : N/A";
            
            break;
       
        case RowTypeItemNotes:
            
            self.headerLabel.text = @"Notes :";
            self.firstDescriptionLabel.text = item.styleNotes?[NSString stringWithFormat:@"Style Notes : %@",item.styleNotes]:@"Style Notes : N/A";
            self.secondDescriptionLabel.text = item.fitNotes?[NSString stringWithFormat:@"Fit Notes : %@",item.fitNotes]:@"Fit Notes : N/A";
            
            break;
            
        case RowTypeItemPrice:
            
            self.headerLabel.text = @"Price :";
            self.firstDescriptionLabel.text = [NSString stringWithFormat:@"Rental Price 8 days : %ld",(long)item.rentalFee8Day];
            self.secondDescriptionLabel.text = [NSString stringWithFormat:@"Rental Price : %ld",(long)item.rentalFee];
            
            break;
            
        case RowTypeItemAdditionalInfo:
            
            self.headerLabel.text = @"Additional Info :";
            self.firstDescriptionLabel.text = item.designer?[NSString stringWithFormat:@"Designer : %@",item.designer]:@"Designer : N/A";
            self.secondDescriptionLabel.text = item.styleName?[NSString stringWithFormat:@"Style Name : %@",item.styleName]:@"Style Name : N/A";
            
            break;
            
        default:
            break;
    }
}

@end
