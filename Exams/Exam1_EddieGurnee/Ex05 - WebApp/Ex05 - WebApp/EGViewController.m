//
//  EGViewController.m
//  Ex05 - WebApp
//
//  Created by Eddie Gurnee on 3/11/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGViewController.h"

@interface EGViewController ()

@end

@implementation EGViewController
@synthesize myWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index"
                                                     ofType:@"html"];
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path
                                                                   isDirectory:NO]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
