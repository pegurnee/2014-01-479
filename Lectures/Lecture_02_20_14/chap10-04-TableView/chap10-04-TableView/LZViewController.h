//
//  LZViewController.h
//  chap10-04-TableView
//
//  Created by compsci on 2/9/13.
//  Copyright (c) 2013 compsci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZRatingViewController.h"

@interface LZViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *myTableData;
@property (strong, nonatomic) NSArray *myImageData;
@property (strong, nonatomic) NSArray *myDetailData;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction) myUnwindFromRatingView:(UIStoryboardSegue *)segue;

@end
