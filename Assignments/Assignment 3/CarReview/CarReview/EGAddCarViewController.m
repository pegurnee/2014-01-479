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
    NSDictionary *logos = [[NSDictionary alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"]];
    imageName = [logos objectForKey: maker];
    
    ratingNumber = [[NSNumber alloc] initWithLong: 0];
    ratingLabel.text = theRatings[0];
    theTitleBar.title = [[NSString alloc] initWithFormat: @"Add New %@", maker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableStuff
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
    return 30;
}

//all the actions when a rating is chosen
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ratingLabel.text = theRatings[indexPath.row];
    ratingNumber = [[NSNumber alloc] initWithLong: indexPath.row];
}

//touch anywhere else to remove keyboard
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [descriptionTextView resignFirstResponder];
    [modelTextField resignFirstResponder];
}

#pragma mark navigation
//while the view is closing
- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self performSegueWithIdentifier:@"unwindToEGModelViewControllerFromAddID" sender:self];
    }
    [super viewWillDisappear:animated];
}

//data to be sent
-(void) prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
        EGModelViewController *modelVC = segue.destinationViewController;
    
        [modelVC setTheDict: theDict];
}

//the save button creates a dictionary of the data that exists, then unwinds to the model view
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
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UINavigationController *rootVC = (UINavigationController*)window.rootViewController;
    EGViewController *homebase = [rootVC viewControllers][0];
    [homebase writeDictionaryToPlist: theDict];
    
    theDict = [homebase dictionaryFromPlist];
    [self performSegueWithIdentifier:@"unwindToEGModelViewControllerFromAddID" sender:self];
}
@end
