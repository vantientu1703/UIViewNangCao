//
//  ColorView.h
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/7/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIView
-(instancetype) initWithHex: (NSString *) hex
                      alpha: (float) alpha
                      frame: (CGRect) rect;
@property (nonatomic, strong) NSString *hex;
-(void) fadeOut;
@end
