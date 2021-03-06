//
//  EGAddCarViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGModelViewController.h"

@interface EGAddCarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *theTitleBar;

- (IBAction)saveBtn:(id)sender;

@property (strong, nonatomic) NSMutableDictionary *theDict;

@property (strong, nonatomic) NSDictionary *theNewCar;
@property (strong, nonatomic) NSArray *theRatings;
@property (strong, nonatomic) NSString *maker;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSNumber *ratingNumber;

@end
