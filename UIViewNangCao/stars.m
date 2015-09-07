//
//  stars.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/5/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "stars.h"

@interface stars ()

@end

@implementation stars
{
    UIImageView *red, *green, *violet, *brown;
    UIView *aboutStar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self addStar];
    [self animate];
}

-(void) addStar {
    
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    
    
    CGFloat margin = 40;
    aboutStar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2, self.view.bounds.size.width - margin * 2)];
    //aboutStar.backgroundColor = [UIColor whiteColor];
    aboutStar.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.view addSubview:aboutStar];
    [aboutStar addSubview:red];
    [aboutStar addSubview:green];
    [aboutStar addSubview:brown];
    [aboutStar addSubview:violet];
    
    CGSize size = aboutStar.bounds.size;
    red.center = CGPointMake(size.width / 2 , size.height / 2);
    brown.center = CGPointMake(size.width / 2 , size.height / 2);
    green.center = CGPointMake(size.width / 2 , size.height / 2);
    violet.center = CGPointMake(size.width / 2 , size.height / 2);
}
-(void) animate {
    
    CGSize size = aboutStar.bounds.size;
    
    [UIView animateWithDuration:2 animations:^{
        red.center = CGPointMake(0, 0);
        brown.center = CGPointMake(size.width, 0);
        green.center = CGPointMake(size.width, size.height);
        violet.center = CGPointMake(0, size.height);
        self.view.backgroundColor = [UIColor whiteColor];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            
            red.center = CGPointMake(0, size.height / 2);
            brown.center = CGPointMake(size.width / 2, 0);
            green.center = CGPointMake(size.width, size.height /2);
            violet.center = CGPointMake(size.width / 2, size.height);
            self.view.backgroundColor = [UIColor darkGrayColor];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:2 animations:^{
                
                
                red.center = CGPointMake(size.width / 2 , size.height / 2);
                brown.center = CGPointMake(size.width / 2 , size.height / 2);
                green.center = CGPointMake(size.width / 2 , size.height / 2);
                violet.center = CGPointMake(size.width / 2 , size.height / 2);
                self.view.backgroundColor = [UIColor blackColor];
                
            } completion:^(BOOL finished) {
                
                [self animate];
            }];
            //red.center = CGPointMake(size.width / 2 , size.height / 2);
            //brown.center = CGPointMake(size.width / 2 , size.height / 2);
            //green.center = CGPointMake(size.width / 2 , size.height / 2);
            //violet.center = CGPointMake(size.width / 2 , size.height / 2);
            
        }];
        
    }];
}
-(void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}
@end
