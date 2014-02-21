//
//  LZViewController.m
//  chap10-04-TableView
//
//  Created by compsci on 2/9/13.
//  Copyright (c) 2013 compsci. All rights reserved.
//

#import "LZViewController.h"

@interface LZViewController ()

@end

@implementation LZViewController

@synthesize myTableData, myImageData, myDetailData;
@synthesize myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    myImageData  = [[NSArray alloc] initWithObjects:@"christmas_decorations", @"christmas_letter", @"christmas_tree", @"present", @"santa_hat", @"snowman", nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MovieList" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *myDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    myTableData = [myDict objectForKey:@"MovieTitle"];
    myDetailData = [myDict objectForKey:@"MovieRating"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.myTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
   
    cell.imageView.image = [UIImage imageNamed:@"snowman"];

    cell.textLabel.text = [myTableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [myDetailData objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"myMovieSegue"]) {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        LZRatingViewController *myRatingViewController = segue.destinationViewController;
        myRatingViewController.myMovieTitleFromSegue = [myTableData objectAtIndex:indexPath.row];
        myRatingViewController.myMovieRatingFromSegue = [myDetailData objectAtIndex:indexPath.row];
    }
}

- (IBAction) myUnwindFromRatingView:(UIStoryboardSegue *)segue {
    LZRatingViewController *myRatingViewController = segue.sourceViewController;
    NSLog(@"Child return %@", myRatingViewController.myRating);
}


@end
