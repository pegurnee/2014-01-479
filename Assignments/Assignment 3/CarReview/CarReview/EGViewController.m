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

@synthesize theDict, myTableView, filePath, logos, theMake;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //all of this was working before the new update... -_-
    /*
    //establish the filePath at the correct location of CarList.plist, in the documents folder of the iOS
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    filePath = [destPath stringByAppendingPathComponent:@"CarList.plist"];
    
    // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:destPath]) {
        NSLog(@"should happen");
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
        NSLog(sourcePath);
        [fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
    }
    NSLog(filePath);
    */
    
    NSString *destPath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    
    // Load the Property List.
    theDict = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    
    //loads the maker arrays from the dictionary
    theMake = [theDict allKeys];
    
    //the logos to be used
    NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
    logos = [[NSArray alloc] initWithContentsOfFile: imageFilePath];
    
    [self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//number of table rows
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
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"%lu Car Models",
                                 (unsigned long)[[theDict objectForKey: theMake[indexPath.row]] count]];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

//everytime the view shows up, save the data
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self.myTableView reloadData];
    if ([self writeDictionaryToPlist: theDict]) {
        //NSLog(@"whaddup!");
    }
}

//sends title and table data for the model
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"toModelView"]) {
        EGModelViewController *modelVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        [modelVC setTheTitle: [theMake objectAtIndex: indexPath.row]];
        [modelVC setTheDict: theDict];
    }
}

//reads a plist dictionary and returns it as a mutableDictionary
- (NSMutableDictionary*)dictionaryFromPlist {
    NSMutableDictionary* propertyListValues = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return propertyListValues;
}

//writes to the plist a user definted dictionary
- (BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict{
    BOOL result = [plistDict writeToFile:filePath atomically:YES];
    return result;
}

@end
