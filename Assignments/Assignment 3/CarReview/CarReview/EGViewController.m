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
    
    //establish the filePath at the correct location of CarList.plist
    filePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    
    //loads the dictionary from the plist
    theDict = [self dictionaryFromPlist];
    
    //loads the maker arrays from the dictionary
    gmTableData = [theDict objectForKey:@"GM"];
    fdTableData = [theDict objectForKey:@"Ford"];
    
    //all the images to be used
    imageData = [[NSArray alloc] initWithObjects:
                                    @"gm_0_logo.", @"fd_0_logo",
                                    @"gm_1_cruze", @"fd_1_fiesta",
                                    @"gm_2_malibu", @"fd_2_fusion",
                                    @"gm_3_spark", @"fd_3_focus",
                 nil];
    
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[self theDict] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"snowman"];
    
    cell.textLabel.text = [gmTableData objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [myDetailData objectAtIndex:indexPath.row];
    
    return cell;
}

//reads a plist dictionary and returns it as a mutableDictionary
- (NSMutableDictionary*)dictionaryFromPlist {
    NSMutableDictionary* propertyListValues = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return propertyListValues;
}

//writes to the plist a user definted dictionary
- (BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict{
    [theDict setObject:gmTableData forKey:@"GM"];
    [theDict setObject:fdTableData forKey:@"Ford"];
    BOOL result = [plistDict writeToFile:filePath atomically:YES];
    return result;
}

@end
