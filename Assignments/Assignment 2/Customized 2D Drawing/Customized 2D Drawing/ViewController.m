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

- (IBAction)red_slider:(id)sender {
    /*
    CGRect rect = CGRectMake(0.0f, 0.0f, self->theView.size.width, self->theView.size.height);
     */
    red_value = [[NSString stringWithFormat:@"%.0f", r_slider.value] floatValue];
    UIColor *color=[UIColor colorWithRed:(red_value/255.0f) green:(green_value/255.0f) blue:(blue_value/255.0f) alpha:1];
    
    [theView drawRect: theView.bounds withColor: color.CGColor];
    /*
    red_value = [[NSString stringWithFormat:@"%.0f", r_slider.value] floatValue];
    UIColor *color=[UIColor colorWithRed:(red_value/255.0f) green:(green_value/255.0f) blue:(blue_value/255.0f) alpha:1];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 250, 250);
    CGContextStrokePath(context);  
     */
}
@end
