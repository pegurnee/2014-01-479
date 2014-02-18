//
//  ViewController.m
//  Customized Drawimg
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)red_slider:(id)sender {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    UIColor color = [UIColor alloc] initWithRed: red_slider.value
green: context   blue:<#(CGFloat)#> alpha:<#(CGFloat)#>
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    
}
@end
