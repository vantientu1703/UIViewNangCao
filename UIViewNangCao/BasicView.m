//
//  BasicView.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/5/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()
@property (weak, nonatomic) IBOutlet UILabel *myView;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (weak, nonatomic) IBOutlet UISlider *sliderRotate;
@property (weak, nonatomic) IBOutlet UISlider *sliderScale;
@property (weak, nonatomic) IBOutlet UISegmentedControl *valueSegment;

@end

@implementation BasicView
{
    int vari;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    vari = false;
}
- (IBAction)onShow:(id)sender {
    if (vari == false) {
        
        _myView.backgroundColor = [UIColor whiteColor];
        vari = true;
    }else {
        
        _myView.backgroundColor = [UIColor blackColor];
        vari = false;
    }
    
}
- (IBAction)onAlpha:(id)sender {
    
    _myView.alpha = _sliderAlpha.value;
}

-(void) RotateandSacle {
    
    _myView.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(_sliderRotate.value * M_PI),CGAffineTransformMakeScale(_sliderScale.value, _sliderScale.value)) ;
    //CGAffineTransform *h;
    
}
- (IBAction)onRotate:(id)sender {
    
    [self RotateandSacle];
}
- (IBAction)onScale:(id)sender {
    
    [self RotateandSacle];
}
- (IBAction)changeColor:(id)sender {
    
    switch (_valueSegment.selectedSegmentIndex) {
        case 0:
            _myView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            _myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            _myView.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            _myView.backgroundColor = [UIColor blueColor];
        default:
            break;
    }
}


@end
