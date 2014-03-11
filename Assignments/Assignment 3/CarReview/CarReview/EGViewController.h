//
//  EGViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/10/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray *myTableData;
@property (strong, nonatomic) NSArray *myImageData;
@property (strong, nonatomic) NSArray *myDetailData;

@end
