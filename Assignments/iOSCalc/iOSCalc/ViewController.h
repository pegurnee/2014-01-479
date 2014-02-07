//
//  ViewController.h
//  iOSCalc
//
//  Created by Edward Gurnee on 2/4/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalcModel.h"

@interface ViewController : UIViewController {
    IBOutlet UIButton *a_button;
    IBOutlet UIButton *s_button;
    IBOutlet UIButton *m_button;
    IBOutlet UIButton *d_button;
    IBOutlet UILabel *calc_display;
    IBOutlet UILabel *sign_display;
    CalcModel *calc_model;
    BOOL sign_pushed;
}

//used for all of the mathematical button events
-(IBAction)push_action:(id)sender;

//used for all of the numeric button events
-(IBAction)push_number:(id)sender;


//other button events
- (IBAction)push_clear:(id)sender;
- (IBAction)push_decimal:(id)sender;
- (IBAction)push_equal:(id)sender;
- (IBAction)push_plusMinus:(id)sender;

//background events
-(void) check_calc_model;

@end
