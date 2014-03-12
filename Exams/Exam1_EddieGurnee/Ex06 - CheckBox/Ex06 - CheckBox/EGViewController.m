//
//  EGViewController.m
//  Ex06 - CheckBox
//
//  Created by Eddie Gurnee on 3/12/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGViewController.h"

@interface EGViewController ()

@end

@implementation EGViewController

@synthesize spade, heart, diamond, club, s_sth, h_sth, d_sth, c_sth;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sSwitch:(id)sender {
    if ([spade alpha] == 1) {
        [spade setAlpha: .2];
    } else {
        [spade setAlpha: 1];
    }
}

- (IBAction)hSwitch:(id)sender {
    if ([heart alpha] == 1) {
        [heart setAlpha: .2];
    } else {
        [heart setAlpha: 1];
    }
}

- (IBAction)dSwitch:(id)sender {
    if ([diamond alpha] == 1) {
        [diamond setAlpha: .2];
    } else {
        [diamond setAlpha: 1];
    }
}

- (IBAction)cSwitch:(id)sender {
    if ([club alpha] == 1) {
        [club setAlpha: .2];
    } else {
        [club setAlpha: 1];
    }
}

- (IBAction)showBtn:(id)sender {
    [spade setAlpha: 1];
    [heart setAlpha: 1];
    [diamond setAlpha: 1];
    [club setAlpha: 1];
    [s_sth setOn: YES];
    [h_sth setOn: YES];
    [d_sth setOn: YES];
    [c_sth setOn: YES];
}

- (IBAction)hideBtn:(id)sender {
    [spade setAlpha: .2];
    [heart setAlpha: .2];
    [diamond setAlpha: .2];
    [club setAlpha: .2];
    [s_sth setOn: NO];
    [h_sth setOn: NO];
    [d_sth setOn: NO];
    [c_sth setOn: NO];
}
@end
