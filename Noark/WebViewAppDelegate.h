//
//  WebViewAppDelegate.h
//  Noark
//
//  Created by Fredrik Forsmo on 2012-08-06.
//  Copyright (c) 2012 Fredrik Forsmo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WebViewAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
