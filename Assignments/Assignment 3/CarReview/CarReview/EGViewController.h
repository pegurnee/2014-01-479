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
@property (strong, nonatomic) NSMutableArray *myTableData;
@property (strong, nonatomic) NSMutableArray *myImageData;
@property (strong, nonatomic) NSMutableArray *myDetailData;

-(NSMutableDictionary*)dictionaryFromPlist;
-(BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict;

@end
