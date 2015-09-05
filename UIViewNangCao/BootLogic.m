//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"UIView", MENU: @[
                                    @{TITLE: @"Camp Fire",CLASS: @"CampFire"},
                                    @{TITLE: @"NestedSquare",CLASS: @"NestedSquare"},
                                    @{TITLE: @"FlyingBird",CLASS: @"FlyingBird"},
                                    @{TITLE: @"Boat on the Sea",CLASS: @"BoatOntheSea"},
                                    @{TITLE: @"Basic View",CLASS: @"BasicView"},
                                    @{TITLE: @"ChessView",CLASS: @"ChessView"},
                                    @{TITLE: @"Star ",CLASS: @"stars"},
                                    @{TITLE: @"Demo Color",CLASS: @"demoColor"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Play Game", MENU: @[
                                           @{TITLE: @"Tapped",CLASS: @"Tapp"}
                                   
                                  ]};
    NSDictionary* advanced = @{SECTION: @"NSArray", MENU: @[
                                    @{TITLE: @"CreateArray", CLASS: @"createArray"}
                                    //@{TITLE: @"CustomSlider", CLASS:@"CustomSlider"}
                                    
                                    ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"UIView Nâng Cao";
    mainScreen.about = @"This is demo by Van Tien Tu";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
