//
//  ViewController.m
//  iOSCalc
//
//  Created by Edward Gurnee on 2/4/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)push_number:(id)sender {
    
}

- (IBAction)push_action:(id)sender {
    if (!calc_model.first_call)
        [self push_equal:0];
    
    if ([[sender title] isEqual: @"+"]) {
       calc_model.sign_state = 'a';
    } else  if ([[sender title]  isEqual: @"-"]) {
       calc_model.sign_state = 's';
    } else  if ([[sender title]  isEqual: @"*"]) {
       calc_model.sign_state = 'm';
    } else  if ([[sender title]  isEqual: @"+"]) {
       calc_model.sign_state = 'd';
    }
    
    [calc_model computeNewDisplayVal:[[calc_display text ]floatValue]];
    [calc_display setText: [NSString stringWithFormat: @"%f", calc_model.running_total]];
}

- (IBAction)push_clear:(id)sender {
}

- (IBAction)push_decimal:(id)sender {
}

- (IBAction)push_equal:(id)sender {
}

- (IBAction)push_plusMinus:(id)sender {
}
- (BOOL) sign_pushed {
    if ([a_button state] == NSOnState || [s_button state] == NSOnState || [m_button state] == NSOnState || [d_button state] == NSOnState)
        return YES;
    else return NO;
}
- (void) check_calc_model {
    @try {
        if (calc_model == nil) {
            calc_model = [[CalcModel alloc] init];
            calc_model.first_call = YES;
        }
    }
    @catch (NSException *ex) {
        NSLog(@"check_calc_model: Caught %@: %@", [ex name], [ex reason]);
    }
}
@end
