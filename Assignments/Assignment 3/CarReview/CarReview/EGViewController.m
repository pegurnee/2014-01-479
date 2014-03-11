//
//  EGViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/10/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGViewController.h"

@interface EGViewController ()

@end

@implementation EGViewController

@synthesize myTableData, myImageData, myDetailData, myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *myDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    myTableData = [myDict objectForKey:@"GM"];
    NSLog(@"hi");
    for (int i = 0; i < 3; i++) {
        /*
        NSString *msg = [[NSString alloc] initWithFormat:@"You've selected %@", [myTableData objectAtIndex: i]];
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Row Select"
                                                          message:msg delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [myAlert show];
         */
        NSLog(@"Object %d: %@", i, [myTableData objectAtIndex: i]);
    }

    
    myDetailData = [myDict objectForKey:@"MovieRating"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
