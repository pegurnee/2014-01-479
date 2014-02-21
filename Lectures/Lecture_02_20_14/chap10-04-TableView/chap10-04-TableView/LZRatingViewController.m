//
//  LZRatingViewController.m
//  chap10-04-TableView
//
//  Created by compsci on 2/19/14.
//  Copyright (c) 2014 compsci. All rights reserved.
//

#import "LZRatingViewController.h"

@interface LZRatingViewController ()

@end

@implementation LZRatingViewController

@synthesize myMovieTitleFromSegue, myMovieRatingFromSegue;
@synthesize myTitleLabel;
@synthesize myRating;

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
    NSString *title = [[NSString alloc] initWithFormat:@"%@ (%@)",myMovieTitleFromSegue, myMovieRatingFromSegue];
    [myTitleLabel setText:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"myReturnSegue"]) {
        myRating = @"****";
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self performSegueWithIdentifier:@"myReturnSegue" sender:self];
    }
    [super viewWillDisappear:animated];
}

@end
