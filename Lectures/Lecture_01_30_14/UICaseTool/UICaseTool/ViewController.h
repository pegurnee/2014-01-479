//
//  ViewController.h
//  UICaseTool
//
//  Created by Edward Gurnee on 1/30/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultsField;
- (IBAction)uppercase:(id)sender;
- (IBAction)lowercase:(id)sender;
- (IBAction)inversecase:(id)sender;

@end
