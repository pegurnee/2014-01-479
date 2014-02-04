//
//  AppDelegate.h
//  CaseTool
//
//  Created by Edward Gurnee on 1/21/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *resultsField;
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)uppercase:(id)sender;
- (IBAction)lowercase:(id)sender;

@end
