//
//  LZRatingViewController.h
//  chap10-04-TableView
//
//  Created by compsci on 2/19/14.
//  Copyright (c) 2014 compsci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZRatingViewController : UIViewController

@property (strong, nonatomic) NSString *myMovieTitleFromSegue;
@property (strong, nonatomic) NSString *myMovieRatingFromSegue;

@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (strong, nonatomic) NSString *myRating;
@end