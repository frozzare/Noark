//
//  AppDelegate.m
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import "AppDelegate.h"

@interface WebPreferences (WebPreferencesPrivate)
- (void)_setLocalStorageDatabasePath:(NSString *)path;
- (void) setLocalStorageEnabled: (BOOL) localStorageEnabled;
@end

@implementation AppDelegate

@synthesize window, webView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (void)awakeFromNib {
    WebPreferences* prefs = [WebPreferences standardPreferences];
    [prefs _setLocalStorageDatabasePath:@"~/Library/Application Support/Noark"];
    [prefs setLocalStorageEnabled:YES];
    
    [webView setPreferences:prefs];
    
    [webView setApplicationNameForUserAgent:@"Noark"];
    
    [webView setFrameLoadDelegate:self];
    [webView setPolicyDelegate:self];
    [webView setUIDelegate:self];
    [webView setGroupName:@"Noark"];
    [webView setMainFrameURL:@"http://forsmo.me"];
    
    // Notification, will use Notification for OS X 10.8 and Growl for older OS X.
    // note = [[Notification alloc] init];
    // [note setNote:@"Noark" :@"Message"];
    // [note show];
    
    
    // Will show a warning, but works.
    // This will close the app when you close the window witch I think is great when you do a
    // native web app. It's like you close a tab.
    [window setDelegate:self];
}

- (void)windowWillClose:(NSNotification *)aNotification {
    [NSApp terminate:self];
}

- (void)webView:(WebView *)sender didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame {
    if (frame == [webView mainFrame]) {
        [window setTitle: title];
    }
}

@end
