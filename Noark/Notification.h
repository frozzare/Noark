//
//  Notification.h
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject {
    NSString *_title;
    NSString *_message;
}

- (id)init;
- (void) setNote:(NSString *)title :(NSString *)message;
- (void) setTitle:(NSString *)title;
- (void) setMessage:(NSString *)message;
- (void) show;

@end
