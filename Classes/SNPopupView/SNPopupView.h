//
//  SNPopupView.h
//  PopupViewTest
//
//  Created by sonson on 10/10/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	SNPopupViewUp		= 1,
	SNPopupViewDown		= 2,
	SNPopupViewRight	= 1 << 8,
	SNPopupViewLeft		= 2 << 8,
}SNPopupViewDirection;

@interface SNPopupView : UIView {
	CGGradientRef gradient;
	CGGradientRef gradient2;
	
	CGRect		contentRect;
	CGRect		contentBounds;
	
	CGRect		popupRect;
	CGRect		popupBounds;
	
	CGRect		viewRect;
	CGRect		viewBounds;
	
	CGPoint		pointToBeShown;
	
	NSString	*title;
	UIImage		*image;
	
	float		horizontalOffset;
	SNPopupViewDirection	direction;
	id			target;
	SEL			action;
}
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIImage *image;
- (id)initWithString:(NSString*)newValue;
- (id)initWithImage:(UIImage*)newImage;
- (void)showAtPoint:(CGPoint)p inView:(UIView*)inView;
- (void)dismiss;
- (void)addTarget:(id)target action:(SEL)action;
@end
