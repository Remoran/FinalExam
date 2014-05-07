//
//  ViewController.m
//  Quiz8
//
//  Created by Ryan on 4/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
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

- (IBAction)drawVertical:(id)sender {
    
    UIRotationGestureRecognizer *rotation = sender;
    [self.drawingView addVertical:rotation.velocity];
    [self.drawingView setNeedsDisplay];
}

- (IBAction)drawHorizontal:(id)sender {
    
    UIRotationGestureRecognizer *rotation = sender;
    [self.drawingView addHorizontal:rotation.velocity];
    [self.drawingView setNeedsDisplay];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        // Clears screen if device shaken.
        [self.drawingView clearScreen];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
