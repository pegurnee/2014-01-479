//
//  EGModelViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGDetailViewController.h"
#import "EGAddCarViewController.h"
#import "EGViewController.h"

@interface EGModelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *theTitleBar;

@property (strong, nonatomic) NSMutableDictionary *theDict;

@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) NSArray *theRatings;
@property (strong, nonatomic) NSString *theTitle;

- (IBAction)unwindToEGModelViewController:(UIStoryboardSegue *)segue;

@end
