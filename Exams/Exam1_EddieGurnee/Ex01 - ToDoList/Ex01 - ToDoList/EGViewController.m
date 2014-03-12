//
//  EGViewController.m
//  Ex01 - ToDoList
//
//  Created by Eddie Gurnee on 3/11/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "EGViewController.h"

/*
@interface EGViewController ()

@end
 */

@implementation EGViewController

@synthesize textField1, tableView1, tableValues;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableValues = [[NSMutableArray alloc] initWithObjects:@"first", @"second", @"third", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// method in UITableViewDataSource protocol
- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection:(NSInteger)section {
    return [tableValues count];
}

// method in NUITableViewDelege protocol
- (UITableViewCell*) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [tableValues objectAtIndex:row];
    
    return cell;
}

- (IBAction)addToArray:(id)sender {
	[tableValues addObject: [textField1 text]];
	[tableView1 reloadData];
}

- (IBAction)backgroundTap:(id)sender {
    [textField1 resignFirstResponder];
}

- (IBAction)deleteFromArray:(id)sender{
    
}

@end
