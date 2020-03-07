//
//  AppDelegate.m
//  LifeCycle
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//if Launch
//ONE
- (BOOL)application:(UIApplication*)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions{
    NSLog(@"Launching\n");

    NSLog(@"willFinishLaunchingWithOptions\n");
    return YES;
}
//TWO
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions\n");
    return YES;
}
//THREE
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"applicationWillEnterForground");
}
//FOUR
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"applicationDidBecomeActive\n");
}

//if Terminate
//one
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"Terminating\n");
    NSLog(@"applicationWillResignActive\n");

}
//two
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"applicationDidEnterBackground\n");
}
//three
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"applicationWillTerminate\n");
}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}



@end
