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
    
    
    CalcModel *calc_model;
}

-(IBAction)push_action:(id)sender;

-(IBAction)push_number:(id)sender;

@end
