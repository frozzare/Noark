//
//  WebViewAppDelegate.h
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "Notification.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow __unsafe_unretained *window;
	IBOutlet WebView *webView;
    Notification *note;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet WebView *webView;

@end