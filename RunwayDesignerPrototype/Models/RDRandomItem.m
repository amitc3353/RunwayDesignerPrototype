//
//  RandomItem.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/8/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDRandomItem.h"

@implementation RDRandomItem

- (void)setImagesBySize:(NSDictionary *)imagesBySize {
    _imagesBySize = imagesBySize;
    
    if(!_itemImage) {
        _itemImage = [RDRandomItemImage new];
    }
    self.itemImage.thumbnailURLs = [_imagesBySize valueForKey:@"183x"];
    self.itemImage.fullSizeURLs = [_imagesBySize valueForKey:@"1080x"];
}

@end
