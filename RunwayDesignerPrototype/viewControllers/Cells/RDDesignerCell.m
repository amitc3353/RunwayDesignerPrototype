//
//  RDDesignerCell.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/9/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDDesignerCell.h"

@implementation RDDesignerCell

- (void)layoutDesignerCellWithItem:(RDDesignerRealm *)designer {
    self.titleLabel.text = designer.designerName;
    self.isSaved = designer.isSaved;
    [self updateSavedState];
}

- (IBAction)saveButtonTapped:(id)sender {
    if(self.delegate) {
        [self.delegate designerCellDidTapSave:self];
    }
    self.isSaved = !self.isSaved;
    [self updateSavedState];
}

- (void)updateSavedState {
    if(!self.isSaved) {
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    } else {
        [self.saveButton setTitle:@"Saved" forState:UIControlStateNormal];
    }
}
@end
