//
//  MySegue.m
//  ByTheWay
//
//  Created by Edward Gurnee on 2/11/14.
//  Copyright (c) 2014 Eddie. All rights reserved.
//

#import "MySegue.h"

@implementation MySegue

- (void) perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    [UIView transitionWithView:src.view.superview  duration:0.8
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src presentModalViewController:dst animated:NO];
                    }
                    completion:NULL];
    
}
@end
