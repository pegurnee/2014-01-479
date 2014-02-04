//
//  ViewController.m
//  UICaseTool
//
//  Created by Edward Gurnee on 1/30/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_textField setText: @"Enter text here"];
	[_resultsField setText: @"Results"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)uppercase:(id)sender {
        NSString *original = [_textField text];
        NSString *uppercase = [original uppercaseString];
        [_resultsField setText: uppercase];
    
}

- (IBAction)lowercase:(id)sender {
    NSString *original = [_textField text];
	NSString *lowercase = [original lowercaseString];
	[_resultsField setText: lowercase];
}

- (IBAction)inversecase:(id)sender {
    NSString *original = [_textField text];
	NSString *lowercase = [original lowercaseString];
	[_resultsField setText: lowercase];
}
@end
