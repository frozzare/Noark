//
//  main.m
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    
    // Enabling WebKit Developer Extras
    // [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"WebKitDeveloperExtras"];
    // [[NSUserDefaults standardUserDefaults] synchronize];
    
    return NSApplicationMain(argc, (const char **)argv);
}
