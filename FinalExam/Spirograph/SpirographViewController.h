//
//  SpirographViewController.h
//  Spirograph
//
//  Created by Ryan on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpirographView.h"
#import "HarmonigraphView.h"

@interface SpirographViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet SpirographView *spirographView;
@property (weak, nonatomic) IBOutlet HarmonigraphView *harmonigraphView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *kSlider;@property (weak, nonatomic) IBOutlet UITextField *stepSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numStepsTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *overWriteSegmentControl;

- (IBAction)redraw:(id)sender;

@end
