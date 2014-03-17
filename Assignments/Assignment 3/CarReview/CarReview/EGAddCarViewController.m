//
//  EGAddCarViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGAddCarViewController.h"

@implementation EGAddCarViewController

@synthesize theDict, theRatings, ratingLabel, maker;

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
    
    ratingLabel.text = theRatings[0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

//all the actions when a rating is chosen
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ratingLabel.text = theRatings[indexPath.row];
    
    /*
    [[theDict objectForKey: maker][carLocation] setObject: [NSNumber numberWithInt: (int)indexPath.row]
     */
}

@end
