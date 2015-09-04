//
//  CampFire.m
//  UIViewNangCao
//
//  Created by Văn Tiến Tú on 9/4/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()
{
    UIImageView *fire;
}
@end

@implementation CampFire
-(void) loadView{
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor blackColor];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self burnFire];
    //NSMutableArray *image = [NSMutableArray alloc] ini
}
-(void) burnFire{
    
    fire = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:17];
    
    for (int i = 1; i < 18; i++) {
        
        NSString *fileName;
        
        if (i < 10) {
            
            fileName = [NSString stringWithFormat:@"campFire0%d.gif",i];
        }else{
            
            fileName = [NSString stringWithFormat:@"campFire%d.gif",i];
        }
        
        [images addObject:[UIImage imageNamed:fileName]];
    }
    
    fire.animationImages = images;
    fire.animationDuration = 1;
    fire.animationRepeatCount = 0;
    
    [self.view addSubview:fire];
    [fire startAnimating];
}

@end
