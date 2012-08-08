//
//  AppDelegate.m
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import "AppDelegate.h"
#import "Notification.h"

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
    [webView setFrameLoadDelegate:self];

    [webView setMainFrameURL:@"http://forsmo.me"];
    
    // Notification, will use Notification for OS X 10.8 and Growl for older OS X.
    // Notification *note = [Notification new];
    // [note setNote:@"Noark" :@"Message"];
    // [note show];
    
    
    // Will show a warning, but works.
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

#pragma mark WebUIDelegate

- (BOOL)webView:(WebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame {
    return NSRunAlertPanel(@"Please confirm", message, @"Yes", @"No", nil) == NSAlertDefaultReturn;
}

- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame {
    NSRunAlertPanel(@"Noark", message, @"Ok", nil, nil);
}

- (void)webView:(WebView *)webView addMessageToConsole:(NSDictionary *)message {
    if (![message isKindOfClass:[NSDictionary class]]) return;
    NSLog(@"JavaScript Console: %@:%@: %@", [[message objectForKey:@"sourceURL"] lastPathComponent], [message objectForKey:@"lineNumber"], [message objectForKey:@"message"]);
}

- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame {
    [windowScriptObject setValue:self forKey:@"Noark"];
}

#pragma mark NoarkNotifications

- (void)notify:(NSString*) title message:(NSString *)message {
    Notification *note = [Notification new];
    [note setNote:title :message];
    [note show];
}

+(NSString*)webScriptNameForSelector:(SEL)sel {
    if(sel == @selector(notify:message:))
        return @"notify";
    return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel {
    return sel != @selector(notify:message:);
}

+ (BOOL) isKeyExcludedFromWebScript:(const char*)name {
    return YES;
}

@end