//
//  DropBall.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/7/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    UIImageView *ball;
    CGFloat x, y, ballRadius, maxHeight, vellocityY, accelerateY;
    NSTimer *timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(dropBall)
                                           userInfo: nil
                                            repeats: true];
}

- (void) addBall {
    
    ballRadius = 64;
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationHeight = [UIApplication sharedApplication].statusBarFrame.size.height +
                                      self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationHeight;
    x = mainViewSize.width / 2;
    y = ballRadius;
    
    vellocityY = 0;
    accelerateY = 9.8;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.png"]];
    ball.center = CGPointMake(x, y);
    
    [self.view addSubview:ball];
}
- (void) dropBall {
    
    vellocityY +=accelerateY;
    y += vellocityY;
    
    if (y > maxHeight) {
        
        vellocityY = -vellocityY * 0.9999;
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
}
@end
