//
//  FlyingBird.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/4/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "FlyingBird.h"
#import <AVFoundation/AVFoundation.h>

@interface FlyingBird ()
{
    UIImageView *bird, *bird1, *bird2, *bird3;
    UIImageView *jungle1, *jungle2;
    AVAudioPlayer *audioPlayer;
}
@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawJungle];
    [self addBird];
    [self animateJungle];
    [self playSong];
    [self flyBird1];
    [self flyBird2];
    //[self FlyUpandDown];
}

-(void) drawJungle{
    
    jungle1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    jungle1.frame = self.view.bounds;
    jungle1.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:jungle1];
    
    jungle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"junglea.jpg"]];
    jungle2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:jungle2];
    
}
-(void) animateJungle {
    
    [UIView animateWithDuration:5 animations:^{
        
        jungle1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        jungle2.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        jungle1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:5 animations:^{
            
            jungle1.frame = self.view.bounds;
            jungle2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            
            jungle2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animateJungle];
        }];
    }];
}
-(void) addBird {
    
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(199, 0, 80, 550)];
    bird1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 650)];
    bird2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 400)];
    bird.contentMode = UIViewContentModeScaleAspectFit;
    bird1.contentMode = UIViewContentModeScaleAspectFit;
    bird2.contentMode = UIViewContentModeScaleAspectFit;
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity: 5];
    for (int i = 1; i < 6; i++) {
        
        NSString *fileName;
        
        fileName = [NSString stringWithFormat:@"bird%d.png",i];
        [images addObject:[UIImage imageNamed:fileName]];
    }
    
    bird.animationImages = images;
    bird.animationRepeatCount = -1; // Forever time
    bird.animationDuration = 1; // Khoang thoi gian chay chua anh?
    [self.view addSubview:bird];
    [bird startAnimating];
    
    
    bird1.animationImages = images;
    bird1.animationRepeatCount = -1; // Forever time
    bird1.animationDuration = 1; // Khoang thoi gian chay chua anh?
    [self.view addSubview:bird1];
    [bird1 startAnimating];
    
    
    bird2.animationImages = images;
    bird2.animationRepeatCount = -1; // Forever time
    bird2.animationDuration = 1; // Khoang thoi gian chay chua anh?
    [self.view addSubview:bird2];
    [bird2 startAnimating];

    
}

-(void) FlyUpandDown {
    
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, -1),
                                                 CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:1 animations:^{
            
            bird.center = CGPointMake(50, 100);
        } completion:^(BOOL finished) {
            [self FlyUpandDown];
        }];
    }];
}

-(void) flyBird1 {
    bird1.transform = CGAffineTransformIdentity;
    bird1.transform = CGAffineTransformMakeRotation(-M_PI_4);
    [UIView animateWithDuration:2 animations:^{
        
        //bird1 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 0, 50, 400)];
        bird1.center = CGPointMake(150, 150);
    } completion:^(BOOL finished) {
        
        bird1.transform = CGAffineTransformMakeRotation(0);
        [UIView animateWithDuration:5 animations:^{
            
            bird1.center = CGPointMake(150, 300);
        } completion:^(BOOL finished) {
            
            [self flyBird1];

            }];
        }];
}

-(void) flyBird2 {
    bird2.transform = CGAffineTransformIdentity;
    bird2.transform = CGAffineTransformMakeRotation(0.3);
    [UIView animateWithDuration:2 animations:^{
        
        //bird1 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 0, 50, 400)];
        bird2.center = CGPointMake(50, 300);
    } completion:^(BOOL finished) {
        
        bird2.transform = CGAffineTransformMakeRotation(-M_PI_4);
        [UIView animateWithDuration:5 animations:^{
            
            bird2.center = CGPointMake(50, 150);
        } completion:^(BOOL finished) {
            
            [self flyBird2];
            
        }];
    }];
}
-(void) playSong {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ChichChoer" ofType:@"mp3"];
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
