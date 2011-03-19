//
//  PopupViewTestAppDelegate.h
//  PopupViewTest
//
//  Created by sonson on 10/10/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopupViewTestViewController;

@interface PopupViewTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PopupViewTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PopupViewTestViewController *viewController;

@end

