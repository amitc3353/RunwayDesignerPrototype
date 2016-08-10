//
//  RDDesignerRealm.h
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/9/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import <Realm/Realm.h>

@interface RDDesignerRealm : RLMObject

@property (nonatomic, strong) NSString *designerName;
@property (nonatomic, assign) BOOL isSaved;

@end
