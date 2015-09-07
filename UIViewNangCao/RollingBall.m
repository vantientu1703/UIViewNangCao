//
//  RollingBall.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/7/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall
{
    UIImageView *ball;
    CGFloat ballRadius;
    NSTimer *timer, *timer2;
    CGPoint center;
    CGFloat deltaAngle, maxWidth, x, y, delta;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    ballRadius = 32;
    maxWidth = mainViewSize.width - ballRadius;
    x = ballRadius;
    y = (mainViewSize.height - statusNavigationBarHeight) / 2;

    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.0005
                                                 target: self
                                               selector: @selector(rollingBall)
                                               userInfo: nil
                                                repeats: true];
    
}
-(void) addBall {
    
    ball = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"football.png"]];
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}
-(void) rollingBall {
    
    //delta = 0.05;
    deltaAngle += delta;
    x = x + delta * ballRadius;
    if (x > maxWidth) {
        
        delta = -0.05;
        deltaAngle = 0;
        x = maxWidth;
    } else if (x <= 32){
        delta = 0.05;
        deltaAngle = 0;
        x = ballRadius;
    }
    ball.transform = CGAffineTransformMakeRotation(deltaAngle);
    ball.center = CGPointMake(x , y);

}
-(void) rollingBallngclai {
    
    delta = -0.05;
    deltaAngle += delta;
    x = x + delta * ballRadius;
    
    ball.transform = CGAffineTransformMakeRotation(deltaAngle);
    ball.center = CGPointMake(x , y);
}
-(void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
