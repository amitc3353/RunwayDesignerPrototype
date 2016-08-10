//
//  RDProductViewController.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDRandomItem.h"

@interface RDProductViewController : UIViewController

@property (nonatomic, strong) RDRandomItem *item;

+ (RDProductViewController *)instantiateFromStoryboard;

@end
