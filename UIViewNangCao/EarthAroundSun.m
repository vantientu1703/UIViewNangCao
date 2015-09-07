//
//  EarthAroundSun.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/7/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "EarthAroundSun.h"

@interface EarthAroundSun ()

@end

@implementation EarthAroundSun
{
    NSTimer *timer, *timer2;
    UIImageView *sun;
    UIImageView *earth, *moon;
    CGPoint sunCenter; //CoreGraphics Point
    CGFloat distanceEarthToSun;
    CGFloat distanceEarthToMoon;
    CGFloat angle;
    CGFloat angle2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self addSunAndEarth];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.00167
                                              target:self
                                            selector:@selector(spinMoonAroundEarth)
                                            userInfo:nil
                                             repeats:true];
}

- (void)addSunAndEarth {
    
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.png"]];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    moon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon2x.png"]];
    
    CGSize mainViewSize = self.view.bounds.size;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sunCenter = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    
    distanceEarthToSun = mainViewSize.width * 0.5 - 40.0;
    distanceEarthToMoon = mainViewSize.width * 0.5 - distanceEarthToSun - 10;
    sun.center = sunCenter;
    angle = 0.0;
    angle2 = 0;
    earth.center = [self computePositionOfEarch:angle];
    moon.center = [self positionMoon:angle];
    
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    [self.view addSubview:moon];
    CGFloat al = earth.center.x;
    NSLog(@"%f",al);
    
}

- (CGPoint)computePositionOfEarch: (CGFloat) _angle {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle),
                       sunCenter.y + distanceEarthToSun * sin(angle));
}
- (CGPoint) positionMoon: (CGFloat) _angle {
    return CGPointMake(earth.center.x + distanceEarthToMoon * cos(angle2) ,
                       earth.center.y + distanceEarthToMoon * sin(angle2));
}
- (void) spinEarth {
    angle += 0.01;
    earth.center = [self computePositionOfEarch:angle];
}
- (void) spinMoonAroundEarth {
    angle2 += 0.01;
    moon.center = [self positionMoon:angle2];
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
