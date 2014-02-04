//
//  CalcController.h
//  Calculator
//
//  Created by Edward Gurnee on 2/3/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalcModel.h"

@interface CalcController : NSObject {
    CalcModel   *calc_model;
}
@property (weak) IBOutlet NSTextField *calc_display;
@property (weak) IBOutlet NSButton *m_button;
@property (weak) IBOutlet NSButton *d_button;
@property (weak) IBOutlet NSButton *s_button;
@property (weak) IBOutlet NSButton *a_button;

//mathematical button events
- (IBAction)push_multiply:(id)sender;
- (IBAction)push_divide:(id)sender;
- (IBAction)push_subtract:(id)sender;
- (IBAction)push_add:(id)sender;

//numeric button events
- (IBAction)push_zero:(id)sender;
- (IBAction)push_one:(id)sender;
- (IBAction)push_two:(id)sender;
- (IBAction)push_three:(id)sender;
- (IBAction)push_four:(id)sender;
- (IBAction)push_five:(id)sender;
- (IBAction)push_six:(id)sender;
- (IBAction)push_seven:(id)sender;
- (IBAction)push_eight:(id)sender;
- (IBAction)push_nine:(id)sender;

//other button events
- (IBAction)push_clear:(id)sender;
- (IBAction)push_decimal:(id)sender;
- (IBAction)push_equal:(id)sender;

//other button events
-(void) push_number: (id) sender;
-(BOOL) sign_pushed;
-(void) check_calc_model;

@end
