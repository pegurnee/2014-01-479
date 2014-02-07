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
    [self check_calc_model];
    
    if (!calc_model.first_call) {
        [self push_equal:0];
    }
    
    if ([[sender title] isEqual: @"+"]) {
       calc_model.sign_state = 'a';
    } else  if ([[sender title]  isEqual: @"-"]) {
       calc_model.sign_state = 's';
    } else  if ([[sender title]  isEqual: @"*"]) {
       calc_model.sign_state = 'm';
    } else  if ([[sender title]  isEqual: @"+"]) {
       calc_model.sign_state = 'd';
    }
    
    [calc_model computeNewDisplayVal: [NSDecimalNumber decimalNumberWithString: [calc_display text]]];
    [calc_display setText: [NSString stringWithFormat: @"%@", [calc_model running_total]]];
    [sign_display setText: [sender title]];
    
    self->sign_pushed = YES;
    
}

- (IBAction)push_clear:(id)sender {
    if (calc_model != nil) {
        calc_model = nil;
    }
    
    [calc_display setText: @"0"];
    
    if (self->sign_pushed) {
        calc_model.sign_state = '0';
    }
}

- (IBAction)push_decimal:(id)sender {
}

- (IBAction)push_equal:(id)sender {
}

- (IBAction)push_plusMinus:(id)sender {
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
