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
    calc_display.numberOfLines = 1;
    calc_display.minimumScaleFactor = 8. / calc_display.font.pointSize;
    calc_display.adjustsFontSizeToFitWidth = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push_number:(id)sender {
    if ([[calc_display text] isEqualToString: @"NaN"]) {
        [calc_display setText:@""];
        calc_model.first_call = YES;
    }
    if (self->sign_pushed) {
        [calc_display setText:@""];
    }
    
    
    if ([[calc_display text] isEqualToString:@"0"] || self->sign_pushed) {
        [calc_display setText:[sender currentTitle]];
    } else {
        [calc_display setText:[[calc_display text] stringByAppendingString:[sender currentTitle]]];
    }
    
    self->sign_pushed = NO;
}

- (IBAction)push_action:(id)sender {    
    if ([[calc_display text] isEqualToString: @"NaN"]) {
        calc_model.first_call = YES;
        [calc_display setText: @"0"];
    }
    [self check_calc_model];
    if (!self->sign_pushed) {
        if ([calc_model sign_state] == 'd' && [[calc_display text] floatValue] == 0) {
            [calc_display setText: @"NaN"];
            [sign_display setText: @""];
        } else {
            [calc_model computeNewDisplayVal: [NSDecimalNumber decimalNumberWithString: [calc_display text]]];
            [calc_display setText: [NSString stringWithFormat: @"%@", [calc_model running_total]]];
        }
    }

    if ([sender tag] == 0) {
       calc_model.sign_state = 'a';
    } else  if ([sender tag] == 1) {
       calc_model.sign_state = 's';
    } else  if ([sender tag] == 2) {
       calc_model.sign_state = 'm';
    } else  if ([sender tag] == 3) {
       calc_model.sign_state = 'd';
    }    
    
    [sign_display setText: [sender currentTitle]];
    
    self->sign_pushed = YES;
    
}

- (IBAction)push_clear:(id)sender {
    if (calc_model != nil) {
        calc_model = nil;
    }
    
    [calc_display setText: @"0"];
    [sign_display setText: @""];
}

- (IBAction)push_decimal:(id)sender {
    if ([[calc_display text] isEqualToString: @"NaN"]) {
        [calc_display setText: @"0"];
        [sign_display setText: @""];
        calc_model.first_call = YES;
    }
    [self check_calc_model];
    if (self->sign_pushed) {
        [calc_display setText:@"0"];
    }
    if ([[calc_display text] rangeOfString:@"."].location == NSNotFound) {
        [calc_display setText:[[calc_display text] stringByAppendingString:@"."]];
        calc_model.first_call = NO;
    }
    self->sign_pushed = NO;
}

- (IBAction)push_equal:(id)sender {
    if ([[calc_display text] isEqualToString: @"NaN"]) {
        [calc_display setText: @"0"];
        [sign_display setText: @""];
        calc_model.first_call = YES;
    }
    [self check_calc_model];
    if ([calc_model sign_state] == 'd' && [[calc_display text] floatValue] == 0) {
        [calc_display setText: @"NaN"];
        calc_model = nil;
    } else {
        [calc_model computeNewDisplayVal:[NSDecimalNumber decimalNumberWithString: [calc_display text]]];
        [calc_display setText: [NSString stringWithFormat: @"%@", [calc_model running_total]]];
        calc_model.first_call = YES;
    }
    [sign_display setText: @""];
}

- (IBAction)push_plusMinus:(id)sender {
    if ([[calc_display text] floatValue] != 0) {
        if (self->sign_pushed) {
            /*
            
             */
            calc_model.running_total = [calc_model.running_total decimalNumberByMultiplyingBy: [NSDecimalNumber decimalNumberWithString: @"-1"]];
        }
        if ([[calc_display text] characterAtIndex:0] == '-' ) {
            [calc_display setText: [[calc_display text] substringFromIndex:1]];
        } else {
            [calc_display setText: [@"-" stringByAppendingString: [calc_display text]]];
        }
    }
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
