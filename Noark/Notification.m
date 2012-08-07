//
//  Notification.m
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//
//  No support for Growl at this moment.

#import "Notification.h"

@implementation Notification


- (id)init {
    return self;
}

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
    NSUserNotification *note = [[NSUserNotification alloc] init];
    [note setTitle: _title];
    [note setInformativeText: _message];
    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center scheduleNotification: note];
}

@end
