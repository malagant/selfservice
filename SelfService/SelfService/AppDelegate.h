//
//  AppDelegate.h
//  SelfService
//
//  Created by Michael Johann on 01.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *mainViewController;

+(void)setSettingsBundleDefaultsForFile:(NSString*)plistFileName;
+(void)setSettingsBundleDefaults;

@end
