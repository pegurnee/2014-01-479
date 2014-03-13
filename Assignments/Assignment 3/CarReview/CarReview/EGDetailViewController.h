//
//  EGDetailViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGDetailViewController : UIViewController

@property (strong, nonatomic) NSString *maker;
@property (strong, nonatomic) NSDictionary *theCar;
@property (strong, nonatomic) NSArray *theRatings;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *theTitleBar;
@property (weak, nonatomic) IBOutlet UIImageView *theImage;

@end
