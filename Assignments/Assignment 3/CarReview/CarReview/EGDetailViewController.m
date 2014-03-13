//
//  EGDetailViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGDetailViewController.h"

@implementation EGDetailViewController

@synthesize theCar, theTitleBar, maker, theRatings, theImage, descriptionLabel, currentRating, carLocation, theDict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.[[NSString alloc] initWithFormat: @"%@ %@", [theTitleBar title], theTitle]]
    theTitleBar.title = [[NSString alloc] initWithFormat: @"%@ %@", maker, [theCar objectForKey: @"Model"]];
    NSString *ratingsFilePath = [[NSBundle mainBundle] pathForResource:@"Ratings" ofType:@"plist"];
    theRatings = [[NSArray alloc] initWithContentsOfFile: ratingsFilePath];
    theImage.image = [UIImage imageNamed: [theCar objectForKey: @"Image"]];
    descriptionLabel.text = [theCar objectForKey: @"Description"];
    
    theDict = [self dictionaryFromPlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//number of table cells
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [theRatings count];
}

//what to do with each cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"RatingPrototypeID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = theRatings[indexPath.row];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"%d", indexPath.row); // you can see selected row number in your console;
    currentRating = [NSNumber numberWithInt: indexPath.row];
    
    
    [[theDict objectForKey: maker][carLocation] setObject: currentRating forKey: @"Rating"];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EGModelViewController *modelVC = segue.destinationViewController;
    //[modelVC setTheTitle: maker];
    //[modelVC setTableData: [theDict objectForKey: [theMake objectAtIndex: indexPath.row]]];
    [modelVC.tableData[carLocation] setObject:currentRating forKey: @"Rating"];
    NSLog(@"new rating %@", currentRating);
    if ([self writeDictionaryToPlist: theDict]) {
        NSLog(@"Victory");
    }
    if ([segue.identifier isEqualToString:@"myReturnSegue"]) {
        //currentRating = @"****";
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        
        //[self performSegueWithIdentifier:@"myReturnSegue" sender:self];
    }
    [super viewWillDisappear:animated];
}

- (NSMutableDictionary*)dictionaryFromPlist {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    NSMutableDictionary* propertyListValues = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return propertyListValues;
}

//writes to the plist a user definted dictionary
- (BOOL)writeDictionaryToPlist:(NSDictionary*)plistDict{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CarList" ofType:@"plist"];
    
    [[theDict objectForKey: maker][carLocation] setObject: currentRating forKey: @"Rating"];
    
    BOOL result = [plistDict writeToFile:filePath atomically:YES];
    return result;
}

@end
