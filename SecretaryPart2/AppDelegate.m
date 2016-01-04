//
//  AppDelegate.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-08-28.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "AppDelegate.h"
#import "anAttendanceRecord.h"
#import "SecretaryHome.h"
#import "Member.h"



@interface AppDelegate ()

@end

@implementation AppDelegate

NSString * const kMemberList = @"kMemberList";
NSString * const kMeetingList = @"kMeetingList";
NSString  *arrayPath;
NSString  *arrayPath2;
//NSUserDefaults *defaults;
//NSUserDefaults *defaults2;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"We ran the code to enter the background");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:memberList];
    [defaults setObject:data forKey:@"savedMemberList"];
    [defaults synchronize];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:meetingList];
    [defaults2 setObject:data2 forKey:@"savedMeetingList"];
    [defaults2 synchronize];
    
        // Path to save array data
//        arrayPath = [[paths objectAtIndex:0]
//                     stringByAppendingPathComponent:@"array.plist"];
//        arrayPath2 = [[paths objectAtIndex:0]
//                      stringByAppendingPathComponent:@"array2.plist"];
    
//    NSMutableArray * array = [[NSMutableArray alloc] init];
//    [array addObject:@"Hello"];
//        // Write array
        NSLog(@"MemberList Count: %lu", (unsigned long)[memberList count]);
        NSLog(@"MeetingList Count: %lu", (unsigned long)[meetingList count]);
//        [memberList writeToFile:arrayPath atomically:YES];
//        [array writeToFile:arrayPath2 atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"We ran the code to enter the foreground");
//    memberList = [NSMutableArray arrayWithContentsOfFile:arrayPath];
//    meetingList = [NSMutableArray arrayWithContentsOfFile:arrayPath2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"savedMemberList"];
    memberList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [defaults synchronize];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSData *data2 = [defaults2 objectForKey:@"savedMeetingList"];
    meetingList = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    [defaults2 synchronize];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //memberList = [NSMutableArray arrayWithContentsOfFile:arrayPath];
//meetingList = [NSMutableArray arrayWithContentsOfFile:arrayPath2];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"savedMemberList"];
    memberList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [defaults synchronize];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSData *data2 = [defaults2 objectForKey:@"savedMeetingList"];
    meetingList = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    [defaults2 synchronize];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    arrayPath = [[paths objectAtIndex:0]
//                 stringByAppendingPathComponent:@"array.out"];
//    arrayPath2 = [[paths objectAtIndex:0]
//                  stringByAppendingPathComponent:@"array.out"];
//    
//    // Write array
//    [memberList writeToFile:arrayPath atomically:YES];
//    [meetingList writeToFile:arrayPath2 atomically:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:memberList];
    [defaults setObject:data forKey:@"savedMemberList"];
    [defaults synchronize];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:meetingList];
    [defaults2 setObject:data2 forKey:@"savedMeetingList"];
    [defaults2 synchronize];
    
}



@end
