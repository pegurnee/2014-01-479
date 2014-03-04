//
//  ViewController.h
//  Customized 2D Drawing
//
//  Created by Edward Gurnee on 2/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Draw 2D.h"

@interface ViewController : UIViewController {
    __weak IBOutlet UISlider *r_slider;
    __weak IBOutlet UISlider *b_slider;
    __weak IBOutlet UISlider *g_slider;
    __weak IBOutlet UISlider *s_slider;
    __weak IBOutlet UISwitch *f_switch;
    __weak IBOutlet UILabel *b_label;
    __weak IBOutlet UILabel *g_label;
    __weak IBOutlet UILabel *r_label;
}
- (IBAction)size_slider:(id)sender;
- (IBAction)changeShape:(id)sender;
- (IBAction)changeColor:(id)sender;
- (IBAction)fillSwitch:(id)sender;

@end
