//
//  SpirographViewController.m
//  Spirograph
//
//  Created by Ryan on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographViewController.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.spirographView.l = 0.3;
    self.spirographView.k = 0.7;
    self.spirographView.numSteps = 2000;
    self.spirographView.stepSize = 0.2;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)showKeyboard:(NSNotification *)arg
{
    CGSize keyboardSize =
    [[[arg userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)hideKeyboard:(NSNotification *)arg
{
    CGSize keyboardSize =
    [[[arg userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame = newFrame;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLayoutSubviews {
    [self.scrollView setContentSize:CGSizeMake(560, 280)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redraw:(id)sender {
    int kIntVal = self.kSlider.value * 10;
    self.spirographView.k = kIntVal/10.0;
    int lIntVal = self.lSlider.value * 10;
    self.spirographView.l = lIntVal/10.0;
    self.spirographView.numSteps = [self.numStepsTextField.text intValue];
    self.spirographView.stepSize = [self.stepSizeTextField.text floatValue];
    for (UIView *view in self.scrollView.subviews) {
        [view setNeedsDisplay];
    }
}



@end
