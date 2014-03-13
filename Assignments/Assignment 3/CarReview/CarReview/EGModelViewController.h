//
//  EGModelViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGModelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *theTitleBar;

@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) NSArray *theRatings;
@property (strong, nonatomic) NSArray *theImages;
@property (strong, nonatomic) NSString *theTitle;
@property (strong, nonatomic) NSString *ratingsFilePath;
@property (strong, nonatomic) NSString *imagesFilePath;

@end