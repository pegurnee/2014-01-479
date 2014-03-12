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

@synthesize gmTableData, fdTableData, theDict, myTableView, filePath, imageData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self->filePath = @"CarList.plist";
    
    // Load the file content and read the data into arrays
    
    theDict = [self dictionaryFromPlist];
    
    gmTableData = [theDict objectForKey:@"GM"];
    fdTableData = [theDict objectForKey:@"Ford"];
    
    imageData = [[NSArray alloc] initWithObjects:
                                    @"gm_0_logo", @"fd_0_logo",
                                    @"gm_1_cruze", @"fd_1_fiesta",
                                    @"gm_2_malibu", @"fd_2_fusion",
                                    @"gm_3_spark", @"fd_3_focus",
                 nil];
    NSLog(@"hi");
    for (int i = 0; i < [gmTableData count]; i++) {
        /*
        NSString *msg = [[NSString alloc] initWithFormat:@"You've selected %@", [myTableData objectAtIndex: i]];
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Row Select"
                                                          message:msg delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [myAlert show];
         */
        NSLog(@"Object %d: %@", i, [gmTableData objectAtIndex: i]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary*)dictionaryFromPlist {
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    */
    
    NSMutableDictionary* propertyListValues = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return propertyListValues;
}

- (BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict{
    [theDict setObject:gmTableData forKey:@"GM"];
    [theDict setObject:fdTableData forKey:@"Ford"];
    
    BOOL result = [plistDict writeToFile:filePath atomically:YES];
    return result;
}

@end
