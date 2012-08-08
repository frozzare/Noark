//
//  Notification.m
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//
//  No support for Growl at this moment.

#import "Notification.h"
#import <Growl/Growl.h>

@implementation Notification

- (void) setNote:(NSString *)title :(NSString *)message {
    _title = title;
    _message = message;
}

 - (void) setTitle:(NSString *)title {
     _title = title;
 }
 
 - (void) setMessage:(NSString *)message {
     _message = message;
 }

- (void) show {
    // Notification Center OS X 10.8
    if (NSClassFromString(@"NSUserNotification")) {
        NSUserNotification *notification = [[NSUserNotification alloc] init];
        [notification setTitle: _title];
        [notification setInformativeText: _message];
        [notification setDeliveryDate:[NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]]];
        [notification setSoundName:NSUserNotificationDefaultSoundName];
        NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
        [center scheduleNotification:notification];
    } else { // Growl for older OS X
        NSBundle *myBundle = [NSBundle bundleForClass:[Notification class]];
        NSString *growlPath = [[myBundle privateFrameworksPath]
                               stringByAppendingPathComponent:@"Growl.framework"];
        NSBundle *growlBundle = [NSBundle bundleWithPath:growlPath];
        if (growlBundle && [growlBundle load]) {
            [GrowlApplicationBridge setGrowlDelegate:self];
            [GrowlApplicationBridge notifyWithTitle:_title description:_message notificationName:@"Noark" iconData:nil priority:0 isSticky:NO clickContext:nil];
        } else {
            NSLog(@"Could not load Growl.framework");
        }
    }
}

@end
