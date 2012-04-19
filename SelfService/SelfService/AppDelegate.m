//
//  AppDelegate.m
//  SelfService
//
//  Created by Michael Johann on 01.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "RegistrationDTO.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

+ (void)setSettingsBundleDefaults {
    [AppDelegate setSettingsBundleDefaultsForFile:@"Root.plist"];
}

+ (void)setSettingsBundleDefaultsForFile:(NSString *)plistFileName {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    //bundle path
    NSString *bPath = [[NSBundle mainBundle] bundlePath];
    NSString *settingsPath = [bPath stringByAppendingPathComponent:@"Settings.bundle"];
    NSString *plistFile = [settingsPath stringByAppendingPathComponent:plistFileName];
    
    //preferences
    NSDictionary *settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:plistFile];
    NSArray *preferencesArray = [settingsDictionary objectForKey:@"PreferenceSpecifiers"];
    
    //loop thru prefs
    NSDictionary *item;
    for (item in preferencesArray) {
        //get the key
        NSString *keyValue = [item objectForKey:@"Key"];
        
        //get the default
        id defaultValue = [item objectForKey:@"DefaultValue"];
        
        // if we have both, set in defaults
        if (keyValue && defaultValue)
            [standardUserDefaults setObject:defaultValue forKey:keyValue];
        
        //get the file item if any - (recurse thru the other settings files)
        NSString *fileValue = [item objectForKey:@"File"];
        if (fileValue)
            [AppDelegate setSettingsBundleDefaultsForFile:[fileValue stringByAppendingString:@".plist"]];
        
    }
    [standardUserDefaults synchronize];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    if (nil == [preferences valueForKey:ServerBaseURL]) {
        [AppDelegate setSettingsBundleDefaults];
    }
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);

    [RKObjectManager objectManagerWithBaseURL:@"http://rails-experts.local:8080/jax.server/rest"];
    // RestKit Mappings initialisieren
    [RegistrationDTO initMapping:[RKObjectManager sharedManager]];

    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];

    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    nVC.navigationBar.topItem.title = @"Self Service";
    self.window.rootViewController = nVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
