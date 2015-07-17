//
//  GradientProgress.m
//  GradientProgressBar
//
//  Created by Soumalya Banerjee on 20/06/15.
//  Copyright (c) 2015 Soumalya Banerjee. All rights reserved.
//

#import "GradientProgress.h"

@interface GradientProgress ()

@property (nonatomic, readwrite) int totalProgressCount;

@end

@implementation GradientProgress {
    UIView *_progressV;
    UILabel *_progressCountIndicator;
    CGRect _progressRectangle;
    UIView *_progressBase;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        _isPercentage = NO;
    }
    return self;
}

- (void)drawProgressWithTotalCount:(int)totalCount andprogressCount:(int)progressCount withRect:(CGRect)progressRect inView:(UIView *)containerView {
    
    _progressRectangle = progressRect;
    _totalProgressCount = totalCount;
    if (totalCount < _totalProgressCount) {
        progressCount = 0;
    }
    
    _progressBase = [[UIView alloc] initWithFrame:progressRect];
    _progressBase.backgroundColor = [UIColor whiteColor];
    _progressBase.layer.borderColor = [UIColor blackColor].CGColor;
    _progressBase.layer.borderWidth = 1.0f;
    _progressBase.layer.cornerRadius = 3.0f;
    [containerView addSubview:_progressBase];
    
    _progressV = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 0.0f, (_progressBase.frame.size.height - 10.0f))];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _progressV.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)UPPER_COLOR, (id)LOWER_COLOR, nil];
    [_progressV.layer insertSublayer:gradient atIndex:0];
    _progressV.layer.cornerRadius = 2.5f;
    _progressV.clipsToBounds = YES;
    [_progressBase addSubview:_progressV];
    
    [self setProgress:progressCount];
}

- (void)setProgress:(int)progressCount {
    
    int totalProgressWidth = _progressRectangle.size.width - 10.0f;
    float progressMade = (totalProgressWidth / _totalProgressCount) * progressCount;
    
    if (_progressV) {
        [_progressV removeFromSuperview];
        _progressV = nil;
    }
    _progressV = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 5.0f, progressMade, (_progressBase.frame.size.height - 10.0f))];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _progressV.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)UPPER_COLOR, (id)LOWER_COLOR, nil];
    [_progressV.layer insertSublayer:gradient atIndex:0];
    _progressV.layer.cornerRadius = 2.5f;
    _progressV.clipsToBounds = YES;
    [_progressBase addSubview:_progressV];
    
    _progressCountIndicator = [[UILabel alloc] initWithFrame:CGRectMake((_progressV.frame.size.width - 60.0f), 5.0f, 55.0f, (_progressV.frame.size.height - 10.0f))];
    _progressCountIndicator.backgroundColor = [UIColor colorWithRed:(191.0f/256.0f) green:(239.0f/256.0f) blue:(255.0f/256.0f) alpha:1.0f];
    _progressCountIndicator.layer.cornerRadius = 2.0f;
    _progressCountIndicator.textColor = [UIColor blackColor];
    _progressCountIndicator.textAlignment = NSTextAlignmentCenter;
    
    NSString *progressCountStr;
    if (_isPercentage) {
        CGFloat progressPercentage = ((float)progressCount / (float)_totalProgressCount) * 100;
        progressCountStr = [NSString stringWithFormat:@"%d%%", (int)lroundf(progressPercentage)];
    } else {
        progressCountStr = [NSString stringWithFormat:@"%d/%d", progressCount, _totalProgressCount];
    }
    _progressCountIndicator.text = progressCountStr;
    _progressCountIndicator.clipsToBounds = YES;
    [_progressV addSubview:_progressCountIndicator];
}

@end
