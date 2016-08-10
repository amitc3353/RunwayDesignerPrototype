//
//  RDRequestManager.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/3/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "RDRequestManager.h"
#import "RDConstants.h"
#import "RDRandomItemsStore.h"

@interface RDRequestManager()

@property (nonatomic) NSURLSession *sharedSession;

@end

@implementation RDRequestManager

+(RDRequestManager *)sharedManager {
    static RDRequestManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RDRequestManager alloc] init];
    });
    
    return manager;
}

- (NSURLSession *)sharedSession {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];

    });
    return session;
}

- (void)fetchRandomItems:(void(^)(NSArray <RDRandomItem *> *items, NSError *error))completionBlock {
    
    NSURL * url = [NSURL URLWithString:kRandomItemsEndpoint];
    
    NSURLSessionDataTask * dataTask = [self.sharedSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        NSLog(@"Got response %@ with error %@.\n", response, error);

                                                        NSArray <RDRandomItem *> *randomItems = [RDRandomItemsStore randomItemsFromJSON:data error:error];
                                                        completionBlock(randomItems, error);
                                                    }];
    
    [dataTask resume];
    
}
- (void)fetchDesignersForDresses:(void(^)(NSArray *designers, NSError *error))completionBlock {
    
    NSURL *dataURL = [NSURL URLWithString:kDesignerDresssesEndpoint];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    
    [[self.sharedSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
          NSLog(@"Got response %@ with error %@.\n", response, error);
          NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
          completionBlock ([dataDict valueForKey:@"designer"], error);
      }
      ]resume];
}

- (void)fetchDesignersForAccessories:(void(^)(NSArray *designers, NSError *error))completionBlock {

    NSURL *dataURL = [NSURL URLWithString:kDesignerAccessoriesEndpoint];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
    [[self.sharedSession dataTaskWithRequest:request
                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                NSError *error)
      {
          NSLog(@"Got response %@ with error %@.\n", response, error);
          NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
          completionBlock ([dataDict valueForKey:@"designer"], error);
      }
      ]resume];
}

@end
