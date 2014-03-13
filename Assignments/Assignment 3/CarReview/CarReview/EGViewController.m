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

@synthesize gmTableData, fdTableData, theDict, myTableView, filePath, logos, theMake;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //establish the filePath at the correct location of CarList.plist
    filePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    
    //loads the dictionary from the plist
    theDict = [self dictionaryFromPlist];
    
    //loads the maker arrays from the dictionary
    theMake = [theDict allKeys];
    gmTableData = [theDict objectForKey:@"GM"];
    fdTableData = [theDict objectForKey:@"Ford"];
    
    //all the images to be used
    
    NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
    NSDictionary *imageDict = [[NSDictionary alloc] initWithContentsOfFile: imageFilePath];
    logos = [imageDict objectForKey: @"Logos"];
    
    for (int i = 0; i < [gmTableData count]; i++) {
        /*
        NSString *msg = [[NSString alloc] initWithFormat:@"You've selected %@", [myTableData objectAtIndex: i]];
        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Row Select"
                                                          message:msg delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [myAlert show];
         */
       // NSLog(@"Object %d: %@", i, [gmTableData objectAtIndex: i]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//number of table cells
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [theMake count];
}

//what to do with each cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"MakerPrototypeID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed: logos[indexPath.row]];
    
    cell.textLabel.text = [theMake objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"%d Car Models", [gmTableData count]];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

//sends title and table data for the model
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"toModelView"]) {
        NSLog(@"hello");
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        EGModelViewController *modelVC = segue.destinationViewController;
        NSLog(@"%@", [theMake objectAtIndex: indexPath.row]);
        [modelVC setTheTitle: [theMake objectAtIndex: indexPath.row]];
        [modelVC setTableData: [theDict objectForKey: [theMake objectAtIndex: indexPath.row]]];
    }
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
