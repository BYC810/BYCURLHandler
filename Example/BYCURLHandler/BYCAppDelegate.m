//
//  BYCAppDelegate.m
//  BYCURLHandler
//
//  Created by BYC810 on 06/29/2020.
//  Copyright (c) 2020 BYC810. All rights reserved.
//

#import "BYCAppDelegate.h"
#import <NSString+BYCURLHandler.h>


@implementation BYCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *urlString = @"https://www.baidu.com?arCode=48020000&cerId=69026276696&curencyCode=156&cusomerIP=183.239.176.114&frontUrl=https%3A%2F%2Fqr.test.95516.com%2FUP02%2FqrcGwWeb-web%2Ffront%2FshowPayResult?sessionId=1883e7d8718f408b815d5c9af40f50fd&inoiceSt=0&ordrDesc=测试订单&orderNo=20200622115005&orderType=16&payeeInfo=e25hbWU95ZWG5oi35ZCN56ewfQ==&paymentValidTime=85443&qrCodeType=0&reqType=0730000903&signature=eFYVwLEnhJw4Ghbc7gr5FCrmcOQjn4kfE+5NrpulzLpWyN8SuDp+Df3c7R776oY95xETpr1PsRoF6KoZOBjEm0rcoCgiAfBTrt0BuO0sB+QkaqBCtEq1BQl/upHhEJ0DPTPBSoXqbeDw2is2lroezfS0NDJxy/wNyEpQWwg7GxGW2HEynk6xpr0AX86ZAt/CSPOe3EWVzpUGr8S/LR2z2u9BxQUFy0Hvx4DoR9IJpVDFhZaf+2B8hflZyfTvpq3MzbwaYIe9lk2u84chaUyYTS/PhbPJvBSC4muAwW7LL1AcAMxIBEhgYcdqG81E685081eZcN16ZwTMiAIq3w5IJg==&txnAm=300&txnNo=7120062232513891576120&userId=570d0b04b70bd367f25abf48402fa77b&version=1.0.0";
    NSDictionary *param = [urlString parseURLParameters];
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
