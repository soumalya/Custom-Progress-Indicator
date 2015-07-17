//
//  GradientProgress.h
//  GradientProgressBar
//
//  Created by Soumalya Banerjee on 20/06/15.
//  Copyright (c) 2015 Soumalya Banerjee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define UPPER_COLOR [[UIColor colorWithRed:(0.0f/256.0f) green:(0.0f/256.0f) blue:(139.0f/256.0f) alpha:1.0f] CGColor]
#define LOWER_COLOR [[UIColor colorWithRed:(100.0f/256.0f) green:(149.0f/256.0f) blue:(237.0f/256.0f) alpha:1.0f] CGColor]

@interface GradientProgress : UIView

@property (nonatomic) BOOL isPercentage;
@property (nonatomic, readonly) int totalProgressCount;

- (void)drawProgressWithTotalCount:(int)totalCount andprogressCount:(int)progressCount withRect:(CGRect)progressRect inView:(UIView *)containerView;
- (void)setProgress:(int)progressCount;

@end
