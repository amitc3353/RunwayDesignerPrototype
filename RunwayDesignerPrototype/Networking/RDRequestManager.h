//
//  RDRequestManager.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/3/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDRandomItem.h"

@interface RDRequestManager : NSObject

+(RDRequestManager *)sharedManager;

- (void)fetchDesignersForDresses:(void(^)(NSArray *designers, NSError *error))completionBlock;
- (void)fetchDesignersForAccessories:(void(^)(NSArray *designers, NSError *error))completionBlock;
- (void)fetchRandomItems:(void(^)(NSArray <RDRandomItem *> *items, NSError *error))completionBlock;


@end
