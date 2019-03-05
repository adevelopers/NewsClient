//
//  AppDelegate.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 04/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "AppDelegate.h"
#import "KKSugar.h"
#import "NewsListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    let rootViewController = [[NewsListViewController alloc] init];
    let navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    _window.rootViewController = navigationController;
    [_window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}



@end
