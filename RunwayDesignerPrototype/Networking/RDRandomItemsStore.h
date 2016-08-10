//
//  RandomItemsStore.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDRandomItemsStore : NSObject

+ (NSArray *)randomItemsFromJSON:(NSData *)data error:(NSError *)error;

@end
