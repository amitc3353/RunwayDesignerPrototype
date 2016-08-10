//
//  RDDesignerCell.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/9/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDDesignerRealm.h"

@class RDDesignerCell;

@protocol RDDesignerCellDelegate <NSObject>

- (void)designerCellDidTapSave:(RDDesignerCell *)cell;

@end

@interface RDDesignerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *saveButton;
@property (nonatomic, assign) BOOL isSaved;
@property (nonatomic, weak) id<RDDesignerCellDelegate> delegate;

- (void)layoutDesignerCellWithItem:(RDDesignerRealm *)designer;

@end
