//
//  EGDetailViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/13/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGDetailViewController.h"

@implementation EGDetailViewController

@synthesize theCar, theTitleBar, maker, theRatings, theImage, descriptionLabel, ratingLabel, carLocation, theDict, willDelete;

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
    theCar = [theDict objectForKey: maker][carLocation];
    
    NSString *ratingsFilePath = [[NSBundle mainBundle] pathForResource:@"Ratings" ofType:@"plist"];
    theRatings = [[NSArray alloc] initWithContentsOfFile: ratingsFilePath];
    
    willDelete = NO;
    
    theTitleBar.title = [[NSString alloc] initWithFormat: @"%@ %@", maker, [theCar objectForKey: @"Model"]];
    theImage.image = [UIImage imageNamed: [theCar objectForKey: @"Image"]];
    descriptionLabel.text = [theCar objectForKey: @"Description"];
    ratingLabel.text = theRatings[[[theCar objectForKey: @"Rating"] intValue]];
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

//all the actions when a rating is chosen
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ratingLabel.text = theRatings[indexPath.row];
    
    [[theDict objectForKey: maker][carLocation] setValue: [NSNumber numberWithLong: indexPath.row]
                                                  forKey: @"Rating"];
}

//while the view is closing
- (void)viewWillDisappear:(BOOL)animated {
    if (willDelete) {
        [[theDict objectForKey: maker] removeObjectAtIndex: carLocation];
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UINavigationController *rootVC = (UINavigationController*)window.rootViewController;
    EGViewController *homebase = [rootVC viewControllers][0];
    [homebase writeDictionaryToPlist: theDict];
    
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self performSegueWithIdentifier:@"unwindToEGModelViewControllerFromDetailID" sender:self];
    }

    [super viewWillDisappear:animated];
}

//popup to confirm deleting
- (IBAction)deleteThisDude:(id)sender {
    UIAlertView *confirm = [[UIAlertView alloc] initWithTitle:@"Confirm Delete"
                                                      message:@"Would you like to delete this car?"
                                                     delegate:self
                                            cancelButtonTitle:@"Yes"
                                            otherButtonTitles:@"No",
                            nil];
  
    [confirm show];
}

//if the button was clicked
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        willDelete = YES;
    }
    
}
@end
