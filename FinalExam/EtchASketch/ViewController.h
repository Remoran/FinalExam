//
//  ViewController.h
//  Quiz8
//
//  Created by Ryan on 4/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DrawView *drawingView;
@property (weak, nonatomic) IBOutlet UIView *leftKnob;
@property (weak, nonatomic) IBOutlet UIView *rightKnob;

- (IBAction)drawHorizontal:(id)sender;
- (IBAction)drawVertical:(id)sender;

@end
