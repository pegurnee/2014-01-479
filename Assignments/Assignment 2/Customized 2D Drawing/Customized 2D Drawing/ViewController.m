//
//  ViewController.m
//  Customized 2D Drawing
//
//  Created by Edward Gurnee on 2/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)size_slider:(id)sender {
    Draw_2D *theView = (Draw_2D*)self.view;
    float new_size = [[NSString stringWithFormat:@"%.0f", s_slider.value] floatValue];
    theView.size = new_size ;// 20.0f;
    
    [theView setNeedsDisplay];
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender;
     Draw_2D *theView = (Draw_2D*)self.view;
    [theView setShapeType:[control selectedSegmentIndex]];
    
    [theView setNeedsDisplay];
}

- (IBAction)changeColor:(id)sender {
    Draw_2D *theView = (Draw_2D*)self.view;
    
    float red_value = theView.red_value;
    float green_value = theView.green_value;
    float blue_value = theView.blue_value;
    
    switch ([sender tag]) {
        case 0:
            red_value = [[NSString stringWithFormat:@"%.0f", r_slider.value] floatValue] / 255.0f;
            theView.red_value = red_value;
            r_label.text = [NSString stringWithFormat: @"%d", (int)(red_value * 255.0)];
            break;
        case 1:
            green_value = [[NSString stringWithFormat:@"%.0f", g_slider.value] floatValue] / 255.0f;
            theView.green_value = green_value;
            g_label.text = [NSString stringWithFormat: @"%d", (int)(green_value * 255.0)];
            break;
        case 2:
            blue_value = [[NSString stringWithFormat:@"%.0f", b_slider.value] floatValue] / 255.0f;
            theView.blue_value = blue_value;
            b_label.text = [NSString stringWithFormat: @"%d", (int)(blue_value * 255.0)];
            break;
        default:
            break;
    }
    
     theView.currentColor = [UIColor colorWithRed:(red_value) green:(green_value) blue:(blue_value) alpha:1];
    
    [theView setNeedsDisplay];
}

- (IBAction)fillSwitch:(id)sender {
    Draw_2D *theView = (Draw_2D*)self.view;
    theView.fill_it = f_switch.isOn;
    [theView setNeedsDisplayInRect: theView.redrawRect];
}

- (IBAction)clear:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Screen Cleared"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    Draw_2D *theView = (Draw_2D*) self.view;
    theView.firstTouch = CGPointMake(0, 0);
    theView.lastTouch = CGPointMake(0, 0);
    
    [theView setNeedsDisplay];
}
@end
