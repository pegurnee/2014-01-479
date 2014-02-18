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
}
- (IBAction)size_slider:(id)sender;
- (IBAction)changeShape:(id)sender;
- (IBAction)changeColor:(id)sender;

@end
