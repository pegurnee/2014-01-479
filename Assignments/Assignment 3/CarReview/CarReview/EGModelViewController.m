//
//  EGModelViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGModelViewController.h"

@implementation EGModelViewController

@synthesize tableData, theTitle, theTitleBar, myTableView, ratingsFilePath, theRatings, theImages, imagesFilePath;

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
	// Do any additional setup after loading the view.
    ratingsFilePath = [[NSBundle mainBundle] pathForResource:@"Ratings" ofType:@"plist"];
    theRatings = [[NSArray alloc] initWithContentsOfFile: ratingsFilePath];
    imagesFilePath = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
    NSDictionary *imagesDict = [[NSDictionary alloc] initWithContentsOfFile: imagesFilePath];
    theImages = [imagesDict objectForKey: theTitle];
    
    [theTitleBar setTitle: [[NSString alloc] initWithFormat: @"%@ %@", [theTitleBar title], theTitle]];
    
//    NSLog(@"%d", [tableData count]);
    for (int i = 0; i < [tableData count]; i++) {
//        NSLog(@"Object %d: %@", i, [tableData objectAtIndex: i]);
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
    return [tableData count];
}

//what to do with each cell
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"ModelPrototypeID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *theModel = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed: theImages[indexPath.row]];
    cell.textLabel.text = [theModel objectForKey: @"Model"];
    
    NSNumber *rating = [theModel objectForKey: @"Rating"];
    int intRating = [rating intValue];
    cell.detailTextLabel.text = theRatings[intRating];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

@end