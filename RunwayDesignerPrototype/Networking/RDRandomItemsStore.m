//
//  RandomItemsStore.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDRandomItemsStore.h"
#import "RDRandomItem.h"

@implementation RDRandomItemsStore

+ (NSArray *)randomItemsFromJSON:(NSData *)data error:(NSError *)error {
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if(error) {
        return nil;
    }
    
    NSMutableArray *randomItems = [NSMutableArray new];
    NSArray *results = [parsedObject valueForKey:@"products"];
    
    for(NSDictionary *itemDict in results) {
        RDRandomItem *item = [RDRandomItem new];
        
        for(NSString *key in itemDict) {
            if([item respondsToSelector:NSSelectorFromString(key)]) {
                [item setValue:[itemDict valueForKey:key] forKey:key];
            }
        }
        
        [randomItems addObject:item];
    }
    
    return randomItems;
}

@end
