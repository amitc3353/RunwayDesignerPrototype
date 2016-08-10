//
//  RDDesignerRealm.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/9/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDDesignerRealm.h"

@implementation RDDesignerRealm

+ (NSString *)primaryKey {
    return @"designerName";
}

+ (NSDictionary *)defaultPropertyValues {
    return @{@"isSaved" : @0};
}

@end
