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
    Draw_2D *theView;
    float red_value;
    float green_value;
    float blue_value;
    __weak IBOutlet UISlider *r_slider;
}
- (IBAction)red_slider:(id)sender;

@end
