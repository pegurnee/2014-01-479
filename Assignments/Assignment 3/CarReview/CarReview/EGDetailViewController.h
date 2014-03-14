//
//  EGDetailViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGModelViewController.h"

@interface EGDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *theTitleBar;
@property (weak, nonatomic) IBOutlet UIImageView *theImage;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (strong, nonatomic) NSMutableDictionary *theDict;

@property (strong, nonatomic) NSString *maker;
@property int carLocation;

@property (strong, nonatomic) NSDictionary *theCar;
@property (strong, nonatomic) NSArray *theRatings;
@property (strong, nonatomic) NSNumber *currentRating;

@end
