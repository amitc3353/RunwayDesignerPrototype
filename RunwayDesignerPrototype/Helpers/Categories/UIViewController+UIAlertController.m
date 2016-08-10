//
//  UIViewController+UIAlertController.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/10/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "UIViewController+UIAlertController.h"

@implementation UIViewController (UIAlertController)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController * alert =   [UIAlertController
                                   alertControllerWithTitle:title
                                   message:message
                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
