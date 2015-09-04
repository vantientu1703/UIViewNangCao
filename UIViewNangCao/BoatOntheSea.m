//
//  BoatOntheSea.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/4/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "BoatOntheSea.h"
#import <AVFoundation/AVFoundation.h>
@interface BoatOntheSea ()

@end

@implementation BoatOntheSea
{
    UIImageView *ship;
    UIImageView *sea1,*sea2,*sea3;
    AVAudioPlayer *audioPlayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawShipandSea];
    [self animateShip];
    [self animateSea];
    [self playSong];
}

-(void) drawShipandSea {
    
    sea1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea1.jpg"]];
    //sea1.contentMode = UIViewContentModeScaleAspectFit;
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea2.jpg"]];
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boat.png"]];
    ship.center = CGPointMake(150, 450);
    [self.view addSubview:ship];
}
-(void) animateShip {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        ship.transform = CGAffineTransformMakeRotation(-0.09);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            ship.transform = CGAffineTransformMakeRotation(0.1);
        } completion:^(BOOL finished) {
            [self animateShip];
        }];
    }];
}
-(void) animateSea {
    
    [UIView animateWithDuration:12 animations:^{
        
        sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        sea2.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        
        sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        
        [UIView animateWithDuration:12 animations:^{
            
            sea1.frame = self.view.bounds;
            sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            
            sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animateSea];
        }];
    }];
}
-(void) playSong {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MyHeartWGO" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
-(void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}
@end
