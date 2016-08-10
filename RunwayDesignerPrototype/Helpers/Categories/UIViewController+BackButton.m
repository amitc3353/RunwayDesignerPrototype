//
//  UIViewController+BackButton.m
//  RunwayDesignerPrototype
//
//  Created by Amit Chandel on 8/9/16.
//  Copyright © 2016 Amit Chandel. All rights reserved.
//

#import "UIViewController+BackButton.h"

@implementation UIViewController (BackButton)

- (void)showBackButton {
    UIImage *backImage = [[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(backButtonTapped)];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
}

- (void)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
