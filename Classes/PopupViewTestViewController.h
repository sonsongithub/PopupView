//
//  PopupViewTestViewController.h
//  PopupViewTest
//
//  Created by sonson on 10/10/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNPopupView;

@interface PopupViewTestViewController : UIViewController {
	SNPopupView		*popup;
	NSArray			*messages;
	int				currentMessageIndex;
}

@end

