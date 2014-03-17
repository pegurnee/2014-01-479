//
//  EGModelViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGModelViewController.h"

@implementation EGModelViewController

@synthesize tableData, theTitle, theTitleBar, myTableView, theRatings, theDict;

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
    NSString *ratingsFilePath = [[NSBundle mainBundle] pathForResource:@"Ratings" ofType:@"plist"];
    theRatings = [[NSArray alloc] initWithContentsOfFile: ratingsFilePath];
    
    tableData = [theDict objectForKey: theTitle];
    [theTitleBar setTitle: [[NSString alloc] initWithFormat: @"%@ %@", [theTitleBar title], theTitle]];
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
    
    NSDictionary *theModel = [tableData objectAtIndex: indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed: [theModel objectForKey: @"Image"]];
    cell.textLabel.text = [theModel objectForKey: @"Model"];
    cell.detailTextLabel.text = theRatings[[[theModel objectForKey: @"Rating"] intValue]];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

//whenever the view shows up the data reloads from the dictionary
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self.myTableView reloadData];
}

//sends title and table data for the model
-(void) prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString: @"toDetailView"]) {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        EGDetailViewController *detailVC = segue.destinationViewController;
        
        [detailVC setMaker: theTitle];
        [detailVC setCarLocation: (int)indexPath.row];
        [detailVC setTheDict: theDict];
    }
}

- (IBAction)unwindToEGModelViewController:(UIStoryboardSegue *)segue {
    EGDetailViewController *returnVC = segue.sourceViewController;
    tableData = [returnVC.theDict objectForKey: theTitle];
    theDict = returnVC.theDict;
}

@end
