//
//  ChessView.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/5/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()

@end

@implementation ChessView
{
    UIView *chessView;
    CGFloat margin;
    UISlider *Rotate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    margin = 20;
    
    chessView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2, self.view.bounds.size.width - margin * 2)];
    chessView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
    chessView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:chessView];
    [self chessBoard];
    [self sliderRotate];
    
}
- (void) chessBoard{
    
    CGFloat cellWidth = (self.view.bounds.size.width - margin * 2) / 8;
    
    for (int dong = 0; dong < 8; dong++) {
        for (int cot = 0 ; cot < 8; cot++) {
            
            UIView *square;
            square = [[UIView alloc] initWithFrame:CGRectMake(cot * cellWidth, dong * cellWidth, cellWidth, cellWidth)];
            
            if (cot % 2 == 0) {
                
                square.backgroundColor = (dong % 2 == 0) ? [UIColor whiteColor] : [UIColor blackColor];
            } else {
                
                square.backgroundColor = (dong % 2 == 0) ? [UIColor blackColor] : [UIColor whiteColor];
            }
            [chessView addSubview:square];
        }
    }
}

-(void) sliderRotate {
    UIView *sliderView;
    
    sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2, 40)];
    //sliderView.backgroundColor = [UIColor whiteColor];
    sliderView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 100);
    
    Rotate = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2, 40)];
    [Rotate setMinimumValue:-1];
    [Rotate setMaximumValue:1];
    Rotate.value = 0;
    
    [sliderView addSubview: Rotate];
    [self.view addSubview:sliderView];
    
    [Rotate addTarget:self action:@selector(onRotate) forControlEvents:UIControlEventAllTouchEvents];
}
-(void) onRotate {
    
    chessView.transform = CGAffineTransformMakeRotation(Rotate.value * M_PI);
}
@end
