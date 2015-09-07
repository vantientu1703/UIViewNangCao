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
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [[UIColor alloc] initWithHex:@"d1e1cf" alpha:1];
    
    CGSize size = self.view.bounds.size;
    CGFloat margin = 40;
    
    UILabel *label;
    label = [[UILabel alloc] initWithFrame:CGRectMake(margin, 100, size.width - margin * 2, 30)];
    label.backgroundColor = [[UIColor alloc] initWithHex:@"0B2265" alpha:1.0];
    label.text = @"#B2265";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    

    UILabel *label1;
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(margin, 150, size.width - margin * 2, 30)];
    label1.backgroundColor = [[UIColor alloc] initWithHex:@"FF4D4D" alpha:1.0];
    label1.text = @"#FF4D4D";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
}

@end
