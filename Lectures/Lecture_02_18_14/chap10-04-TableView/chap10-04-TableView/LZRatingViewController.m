//
//  LZRatingViewController.m
//  chap10-04-TableView
//
//  Created by Edward Gurnee on 2/18/14.
//  Copyright (c) 2014 compsci. All rights reserved.
//

#import "LZRatingViewController.h"

@interface LZRatingViewController ()

@end

@implementation LZRatingViewController

@synthesize myMovieRatingFromSegue, myMovieTitleFromSegue, myTitleLabel;

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
	NSString *title = [[NSString alloc] initWithFormat:@"%@ (%@)",myMovieTitleFromSegue, myMovieRatingFromSegue];
    [myTitleLabel setText:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
