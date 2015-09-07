//
//  ColorViewHex3.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/7/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ColorViewHex3.h"
#import "ColorView.h"
@interface ColorViewHex3 ()

@end

@implementation ColorViewHex3
{
    ColorView *view1, *view2, *view3, *view4, *view5;
    NSArray *cpArray;
    int colorIndex;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSArray* cp1 = @[@"ECD078", @"D95B43", @"C02942", @"542437", @"53777A"];
    NSArray* cp2 = @[@"00A0B0", @"6A4A3C", @"CC333F", @"EB6841", @"EDC951"];
    NSArray* cp3 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD", @"E5FCC2"];
    NSArray* cp4 = @[@"FF9900", @"424242", @"E9E9E9", @"BCBCBC", @"3299BB"];
    NSArray* cp5 = @[@"5E412F", @"FCEBB6", @"78C0A8", @"F07818", @"F0A830"];
    NSArray* cp6 = @[@"FAD089", @"FF9C5B", @"F5634A", @"ED303C", @"3B8183"];
    
    cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    
    CGSize size = self.view.bounds.size;
    CGFloat margin = 50;
    
    view1 = [[ColorView alloc] initWithHex:@"FE4365" alpha:1 frame: CGRectMake(margin, 30, size.width - margin * 2, 30)];
    
    view2 = [[ColorView alloc] initWithHex:@"FC9D9A" alpha:1 frame: CGRectMake(margin, 80, size.width - margin * 2 , 30)];
    
    view3 = [[ColorView alloc] initWithHex:@"F9CDAD" alpha:1 frame: CGRectMake(margin, 130, size.width - margin * 2 , 30)];
    
    view4 = [[ColorView alloc] initWithHex:@"C8C8A9" alpha:1 frame: CGRectMake(margin, 180, size.width - margin * 2 , 30)];
    
    view5 = [[ColorView alloc] initWithHex:@"83AF9B" alpha:1 frame: CGRectMake(margin, 230, size.width - margin * 2 , 30)];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    
    colorIndex = 0;
    [self performSelector: @selector(animateColor:)
               withObject: [[NSNumber alloc] initWithInt: colorIndex]
               afterDelay: 1];
    
}
-(void) animateColor: (NSNumber*) cpIndex {
    
    int index = [cpIndex intValue];
    
    [UIView animateWithDuration:5.0
                     animations:^{
                         NSArray *cp  = cpArray[index];
                         
                         
                         [view1 fadeOut];
                         [view2 fadeOut];
                         [view3 fadeOut];
                         [view4 fadeOut];
                         [view5 fadeOut];

                         view1.hex = cp[0];
                         view2.hex = cp[1];
                         view3.hex = cp[2];
                         view4.hex = cp[3];
                         view5.hex = cp[4];
                     } completion:^(BOOL finished) {

                             self->colorIndex++;
                             
                             if (self->colorIndex == self->cpArray.count) {
                                 
                                 self->colorIndex = 0;
                             }
                             [self animateColor:[[NSNumber alloc] initWithInt:colorIndex]];

                             
                         //}];
                     }];
}
@end
