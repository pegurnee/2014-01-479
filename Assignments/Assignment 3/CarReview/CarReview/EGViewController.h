//
//  EGViewController.h
//  CarReview
//
//  Created by Eddie Gurnee on 3/10/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGModelViewController.h"

@interface EGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSArray *imageData;
@property (strong, nonatomic) NSArray *theMake;
@property (strong, nonatomic) NSMutableArray *gmTableData;
@property (strong, nonatomic) NSMutableArray *fdTableData;
@property (strong, nonatomic) NSMutableDictionary *theDict;
@property (strong, nonatomic) NSString *filePath;

-(NSMutableDictionary*)dictionaryFromPlist;
-(BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict;

@end
