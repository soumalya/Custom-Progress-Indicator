//
//  ViewController.m
//  GradientProgressBar
//
//  Created by Soumalya Banerjee on 20/06/15.
//  Copyright (c) 2015 Soumalya Banerjee. All rights reserved.
//

#import "ViewController.h"
#import "GradientProgress.h"

#define _TOTAL_COUNT 10
#define _PROGRESS_COUNT 3


@interface ViewController () {
    GradientProgress *progress;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Custom gradient progress bar
    progress = [[GradientProgress alloc] init];
    progress.isPercentage = NO;
    [progress drawProgressWithTotalCount:_TOTAL_COUNT andprogressCount:_PROGRESS_COUNT withRect:CGRectMake(50.0f, 200.0f, 270.0f, 40.0f) inView:self.view];

}




- (IBAction)increaseProgress:(id)sender {
    
    [progress setProgress:6];
    
}


@end
