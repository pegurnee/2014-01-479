//
//  EGViewController.h
//  Ex06 - CheckBox
//
//  Created by Eddie Gurnee on 3/12/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *spade;
@property (weak, nonatomic) IBOutlet UIImageView *heart;
@property (weak, nonatomic) IBOutlet UIImageView *diamond;
@property (weak, nonatomic) IBOutlet UIImageView *club;
@property (weak, nonatomic) IBOutlet UISwitch *s_sth;
@property (weak, nonatomic) IBOutlet UISwitch *h_sth;
@property (weak, nonatomic) IBOutlet UISwitch *d_sth;
@property (weak, nonatomic) IBOutlet UISwitch *c_sth;

- (IBAction)sSwitch:(id)sender;
- (IBAction)hSwitch:(id)sender;
- (IBAction)dSwitch:(id)sender;
- (IBAction)cSwitch:(id)sender;

- (IBAction)showBtn:(id)sender;
- (IBAction)hideBtn:(id)sender;

@end
