//
//  CalcController.m
//  Calculator
//
//  Created by Edward Gurnee on 2/3/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "CalcController.h"

@implementation CalcController

- (IBAction)push_multiply:(id)sender {
    if ([_a_button state] == NSOnState || [_s_button state] == NSOnState || [_d_button state] == NSOnState)
        [_m_button setState:NSOffState];
    else {
        [self check_calc_model];
        
        if (!calc_model.first_call)
            [self push_equal:0];
        
        calc_model.sign_state = 'm';
        [calc_model computeNewDisplayVal:[_calc_display floatValue]];
        [_calc_display setFloatValue:calc_model.running_total];
    }
}
- (IBAction)push_divide:(id)sender {
    if ([_a_button state] == NSOnState || [_s_button state] == NSOnState || [_m_button state] == NSOnState) {
        [_d_button setState:NSOffState];
    }
    else {
        [self check_calc_model];
        
        if (!calc_model.first_call)
            [self push_equal:0];
        
        calc_model.sign_state = 'd';
        [calc_model computeNewDisplayVal:[_calc_display floatValue]];
        [_calc_display setFloatValue:calc_model.running_total];
    }
}
- (IBAction)push_subtract:(id)sender {
    if ([_a_button state] == NSOnState || [_m_button state] == NSOnState || [_d_button state] == NSOnState)
        [_s_button setState:NSOffState];
    else {
        [self check_calc_model];
        
        if (!calc_model.first_call)
            [self push_equal:0];
        
        calc_model.sign_state = 's';
        [calc_model computeNewDisplayVal:[_calc_display floatValue]];
        [_calc_display setFloatValue:calc_model.running_total];
    }
}
- (IBAction)push_add:(id)sender {
    if ([_m_button state] == NSOnState || [_s_button state] == NSOnState || [_d_button state] == NSOnState) {
        [_a_button setState:NSOffState];
    }
    else {
        [self check_calc_model];
        
        if (!calc_model.first_call)
            [self push_equal:0];
        
        calc_model.sign_state = 'a';
        [calc_model computeNewDisplayVal:[_calc_display floatValue]];
        [_calc_display setFloatValue:calc_model.running_total];
    }
}

- (IBAction)push_zero:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_one:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_two:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_three:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_four:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_five:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_six:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_seven:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_eight:(id)sender {
    [self push_number:sender];
}
- (IBAction)push_nine:(id)sender {
    [self push_number:sender];
}

- (IBAction)push_clear:(id)sender {
    
    if (calc_model != nil) {
        calc_model = nil;
    }
    
    
    [_calc_display setIntValue:0];
    
    if ([self sign_pushed]) {
        [_a_button setState:0];
        [_d_button setState:0];
        [_m_button setState:0];
        [_s_button setState:0];
    }
}
- (IBAction)push_decimal:(id)sender {
    if ([self sign_pushed]) {
        [_a_button setState:0];
        [_d_button setState:0];
        [_m_button setState:0];
        [_s_button setState:0];
        [_calc_display setStringValue:@""];
    }
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"[.]"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    NSUInteger numMatches = [regex numberOfMatchesInString:[_calc_display stringValue] options:0 range:NSMakeRange(0, [[_calc_display stringValue] length])];

    if (numMatches == 0) {
        [_calc_display setStringValue:[[_calc_display stringValue] stringByAppendingString:@"."]];
    }
    
    /*
    if ([[_calc_display stringValue] rangeOfString:@"."].location != 0) {
        [_calc_display setStringValue:[[_calc_display stringValue] stringByAppendingString:@"."]];
    }
     
     NSString *someRegexp = @"[.]";
     NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", someRegexp];

    if (![[_calc_display stringValue] isMatchedByRegex:@"[.]"])
        [_calc_display setStringValue:[[_calc_display stringValue] stringByAppendingString:@"."]];
     */
}
- (IBAction)push_equal:(id)sender {
    [self check_calc_model];
    [calc_model computeNewDisplayVal:[_calc_display floatValue]];
    [_calc_display setFloatValue:calc_model.running_total];
    calc_model.first_call = YES;
}

- (IBAction)push_plusMinus:(id)sender {
    if ([_calc_display floatValue] != 0) {
        if ([[_calc_display stringValue] characterAtIndex:0] == '-' ) {
            [_calc_display setStringValue: [[_calc_display stringValue] substringFromIndex:1]];
        } else {
            [_calc_display setStringValue: [@"-" stringByAppendingString: [_calc_display stringValue]]];
        }
    }
    
}

- (void) push_number: (id) sender {
    if ([self sign_pushed]) {
        [_a_button setState:0];
        [_d_button setState:0];
        [_m_button setState:0];
        [_s_button setState:0];
        [_calc_display setStringValue:@""];
    }
    
    if ([[_calc_display stringValue] compare:@"0"] && !calc_model.first_call) {
        [_calc_display setStringValue:[[_calc_display stringValue] stringByAppendingString:[sender title]]];
    } else {
        [_calc_display setStringValue:[sender title]];
        calc_model.first_call = NO;
    }
    
}
- (BOOL) sign_pushed {
    if ([_a_button state] == NSOnState || [_s_button state] == NSOnState || [_m_button state] == NSOnState || [_d_button state] == NSOnState)
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
