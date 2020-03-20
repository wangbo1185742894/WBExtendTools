//
//  WBAppDelegate.m
//  WBExtendTools
//
//  Created by wangbo1185742894 on 03/17/2020.
//  Copyright (c) 2020 wangbo1185742894. All rights reserved.
//

#import "WBAppDelegate.h"

@implementation WBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.count = 0;
    self.marray = [NSMutableArray new];
    
    NSLog(@"%ld",[self test:5 and:0 and:[NSMutableArray array]]);
    NSLog(@"%@",self.marray);
    return YES;
}
-(NSInteger)test:(NSInteger)n and:(NSInteger)count and:(NSMutableArray * )arr{
    if (n != 0) {
        count ++;
        
    }
    if (n <= 1) {
        if (n == 1) {
            [arr addObject:@"1"];
        }
        [self.marray addObject:@(count)];
        NSLog(@"%@",arr);
        return 1;
    }else{
        
        if ( n < 3) {
            
            [arr addObject:@"1"];
            return [self test:n - 1 and:count and:arr];
        }else if (n < 5){
            NSMutableArray *mArray3 = [arr mutableCopy];
            [arr addObject:@"1"];
            [mArray3 addObject:@"3"];
            return [self test:n - 1 and:count and:arr] + [self test:n - 3 and:count and:mArray3];
        }else{
            NSMutableArray *mArray3 = [arr mutableCopy];
            NSMutableArray *mArray5 = [arr mutableCopy];
            [arr addObject:@"1"];
            [mArray3 addObject:@"3"];
            [mArray5 addObject:@"5"];
            return [self test:n - 1 and:count and:arr] + [self test:n - 3 and:count and:mArray3] + [self test:n - 5 and:count and:mArray5];
        }
    }
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
