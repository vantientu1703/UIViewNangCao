//
//  demoColor.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/6/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "demoColor.h"
#import "UIColor+Extend.h"
@interface demoColor ()

@end

@implementation demoColor

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = self.view.bounds.size;
    float PI = 3.14;
    
    self.view.backgroundColor = [[UIColor alloc] initWithHex:@"d1e1cf" alpha:1];
    UILabel *label;
    label = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 130, 30)];
    label.backgroundColor = [[UIColor alloc] initWithHex:@"0B2265" alpha:1.0];
    label.text = @"#B2265";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.center = CGPointMake(size.width / 3, size.height / 3);
    label.transform = CGAffineTransformMakeRotation(PI / 1.5);
    [self.view addSubview:label];
    
    //self.view.backgroundColor = [[UIColor alloc] initWithHex:@"d1e1cf" alpha:1];
    UILabel *label1;
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 130, 30)];
    label1.backgroundColor = [[UIColor alloc] initWithHex:@"FF4D4D" alpha:1.0];
    label1.text = @"#FF4D4D";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    label1.center = CGPointMake(size.width / 2, size.height / 3);
    label1.transform = CGAffineTransformMakeRotation(PI / 1.7);
    [self.view addSubview:label1];
}

@end
