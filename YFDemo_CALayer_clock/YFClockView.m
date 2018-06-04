//
//  YFClockView.m
//  YFDemo_CALayer_clock
//
//  Created by 亚飞 on 2018/6/4.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "YFClockView.h"

#define ClockBgImage       @"clockBg.jpg"
#define HourPointerImage   @"hourPointer"
#define MinutePointerImage @"minutePointer"
#define SecondPointerImage @"secondPointer"


@implementation YFClockView
{
    NSTimer *_timer;
    UIImageView *_clockBg;
    UIImageView *_hourPointer;
    UIImageView *_minutePointer;
    UIImageView *_secondPointer;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        [self initViews];
        [self clockAction];

        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(clockAction)  userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)initViews {
    _clockBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _clockBg.image = [UIImage imageNamed:ClockBgImage];
    _clockBg.center = self.center;
    [self addSubview:_clockBg];

    _hourPointer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 93)];
    _hourPointer.image             = [UIImage imageNamed:HourPointerImage];
    _hourPointer.center            = CGPointMake(_clockBg.frame.size.width/2, _clockBg.frame.size.height/2);
    _hourPointer.layer.anchorPoint = CGPointMake(0.5, 0.92);
    [_clockBg addSubview:_hourPointer];

    _minutePointer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 120)];
    _minutePointer.image             = [UIImage imageNamed:MinutePointerImage];
    _minutePointer.center            = CGPointMake(_clockBg.frame.size.width/2, _clockBg.frame.size.height/2);
    _minutePointer.layer.anchorPoint = CGPointMake(0.5, 0.945);
    [_clockBg addSubview:_minutePointer];

    _secondPointer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 220)];
    _secondPointer.image             = [UIImage imageNamed:SecondPointerImage];
    _secondPointer.center            = CGPointMake(_clockBg.frame.size.width/2, _clockBg.frame.size.height/2);
    _secondPointer.layer.anchorPoint = CGPointMake(0.5, 0.65);
    [_clockBg addSubview:_secondPointer];

}



- (void)clockAction {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents * components = [calendar components:units fromDate:[NSDate date]];

    CGFloat hourAngle   = (components.hour *3600 + components.minute*60 +components.second) / (12*3600.f) * 2*M_PI;
    CGFloat minuteAngle = (components.minute*60 +components.second) / 3600.f * 2*M_PI;
    CGFloat secondAngle = (components.second) / 60.f * 2*M_PI;


    _hourPointer.transform   = CGAffineTransformMakeRotation(hourAngle);
    _minutePointer.transform = CGAffineTransformMakeRotation(minuteAngle);
    _secondPointer.transform = CGAffineTransformMakeRotation(secondAngle);

}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
