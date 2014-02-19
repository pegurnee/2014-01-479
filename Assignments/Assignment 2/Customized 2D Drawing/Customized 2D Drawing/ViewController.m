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
    
    [theView setNeedsDisplayInRect: theView.redrawRect];
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender;
     Draw_2D *theView = (Draw_2D*)self.view;
    [theView setShapeType:[control selectedSegmentIndex]];
    
    [theView setNeedsDisplayInRect: theView.redrawRect];
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
            break;
        case 1:
            green_value = [[NSString stringWithFormat:@"%.0f", g_slider.value] floatValue] / 255.0f;
            theView.green_value = green_value;
            break;
        case 2:
            blue_value = [[NSString stringWithFormat:@"%.0f", b_slider.value] floatValue] / 255.0f;
            theView.blue_value = blue_value;
            break;
        default:
            break;
    }
    
     theView.currentColor = [UIColor colorWithRed:(red_value) green:(green_value) blue:(blue_value) alpha:1];
    
    [theView setNeedsDisplayInRect: theView.redrawRect];
}
@end
