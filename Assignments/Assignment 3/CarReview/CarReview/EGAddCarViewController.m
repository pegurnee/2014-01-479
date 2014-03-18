//
//  EGAddCarViewController.m
//  CarReview
//
//  Created by Eddie Gurnee on 3/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGAddCarViewController.h"

@implementation EGAddCarViewController

@synthesize theDict, theRatings, ratingLabel, maker, theTitleBar, theNewCar, descriptionTextView, modelTextField, ratingNumber, imageName;

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
    NSArray *logos = [[NSArray alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"]];
    
    if ([maker isEqualToString: @"GM"]) {
        imageName = logos[1];
    } else {
        imageName = logos[0];
    }
    
    ratingNumber = [[NSNumber alloc] initWithLong: 0];
    ratingLabel.text = theRatings[0];
    theTitleBar.title = [[NSString alloc] initWithFormat: @"Add New %@", maker];
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
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = theRatings[indexPath.row];
    
    return cell;
}

//sets the height of each cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

//all the actions when a rating is chosen
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ratingLabel.text = theRatings[indexPath.row];
    ratingNumber = [[NSNumber alloc] initWithLong: indexPath.row];
    /*
    [[theDict objectForKey: maker][carLocation] setObject: [NSNumber numberWithInt: (int)indexPath.row]
     */
}

//while the view is closing
- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self performSegueWithIdentifier:@"unwindToEGModelViewControllerFromAddID" sender:self];
    }
    [super viewWillDisappear:animated];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
        EGModelViewController *modelVC = segue.destinationViewController;
        NSLog(@"save?");
        [modelVC setTheDict: theDict];
}

- (IBAction)saveBtn:(id)sender {
    //rating, model, image, description
    NSArray *data = [[NSArray alloc] initWithObjects:
                     ratingNumber,
                     modelTextField.text,
                     imageName,
                     descriptionTextView.text,
                     nil];
    NSArray *carKeys = [[theDict objectForKey: maker][0] allKeys];
    theNewCar = [[NSDictionary alloc] initWithObjects: data forKeys:carKeys];
    [[theDict objectForKey: maker] addObject: theNewCar];
    
    [self performSegueWithIdentifier:@"unwindToEGModelViewControllerFromAddID" sender:self];
}
@end
