//
//  EGViewController.h
//  Ex01 - ToDoList
//
//  Created by Eddie Gurnee on 3/11/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;

@property (strong, nonatomic) NSMutableArray *tableValues;

- (IBAction)addToArray:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)deleteFromArray:(id)sender;

@end
