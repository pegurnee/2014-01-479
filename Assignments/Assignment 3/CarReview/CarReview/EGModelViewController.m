//
//  EGModelViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGModelViewController.h"

@implementation EGModelViewController

@synthesize tableData, theTitle, theTitleBar, myTableView, ratingsFilePath, theRatings;

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
    
    [theTitleBar setTitle: [[NSString alloc] initWithFormat: @"%@ %@", [theTitleBar title], theTitle]];
    
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
    cell.imageView.image = [UIImage imageNamed: [theModel objectForKey: @"Image"]];
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

//sends title and table data for the model
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"toDetailView"]) {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        EGDetailViewController *modelVC = segue.destinationViewController;
        [modelVC setTheCar: [tableData objectAtIndex: indexPath.row]];
        [modelVC setMaker: theTitle];
    }
}

@end
