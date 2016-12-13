//
//  AppDelegate.m
//  ios生成本地验证码
//
//  Created by 云媒 on 16/10/9.
//  Copyright © 2016年 云媒. All rights reserved.
//

#import "AppDelegate.h"
#import "AuthCodeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyWindow];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[AuthCodeViewController alloc]init];
    
    return YES;
}


@end
