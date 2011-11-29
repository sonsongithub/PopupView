/*
 * PopupView
 * SNPopupView.h
 *
 * Copyright (c) Yuichi YOSHIDA, 10/12/07.
 * All rights reserved.
 * 
 * BSD License
 *
 * Redistribution and use in source and binary forms, with or without modification, are 
 * permitted provided that the following conditions are met:
 * - Redistributions of source code must retain the above copyright notice, this list of
 *  conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this list
 *  of conditions and the following disclaimer in the documentation and/or other materia
 * ls provided with the distribution.
 * - Neither the name of the "Yuichi Yoshida" nor the names of its contributors may be u
 * sed to endorse or promote products derived from this software without specific prior 
 * written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY E
 * XPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES O
 * F MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SH
 * ALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENT
 * AL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROC
 * UREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS I
 * NTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI
 * CT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF T
 * HE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <UIKit/UIKit.h>

//#define _CONFIRM_REGION

#define SHADOW_OFFSET					CGSizeMake(10, 10)
#define CONTENT_OFFSET					CGSizeMake(10, 10)
#define POPUP_ROOT_SIZE					CGSizeMake(20, 10)

#define HORIZONTAL_SAFE_MARGIN			30

#define POPUP_ANIMATION_DURATION		0.3
#define DISMISS_ANIMATION_DURATION		0.2

#define DEFAULT_TITLE_SIZE				20

#define ALPHA							0.6

#define BAR_BUTTON_ITEM_UPPER_MARGIN	10
#define BAR_BUTTON_ITEM_BOTTOM_MARGIN	5

@class TouchPeekView;

typedef enum {
	SNPopupViewUp		= 1,
	SNPopupViewDown		= 2,
	SNPopupViewRight	= 1 << 8,
	SNPopupViewLeft		= 2 << 8,
}SNPopupViewDirection;

@class SNPopupView;

@protocol SNPopupViewModalDelegate <NSObject>

- (void)didDismissModal:(SNPopupView*)popupview;

@end

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
	float		fontSize;
	
	UIView		*contentView;
	
	float		horizontalOffset;
	SNPopupViewDirection	direction;
	id			target;
	SEL			action;
	
	TouchPeekView	*peekView;
	id<SNPopupViewModalDelegate>delegate;
	
	BOOL		animatedWhenAppering;
}
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) UIView *contentView;
@property (nonatomic, assign) id <SNPopupViewModalDelegate> delegate;

- (id)initWithString:(NSString*)newValue withFontOfSize:(float)newFontSize;
- (id)initWithString:(NSString*)newValue;
- (id)initWithImage:(UIImage*)newImage;
- (id)initWithContentView:(UIView*)newContentView contentSize:(CGSize)contentSize;

- (void)showAtPoint:(CGPoint)p inView:(UIView*)inView;
- (void)showAtPoint:(CGPoint)p inView:(UIView*)inView animated:(BOOL)animated;

- (void)presentModalAtPoint:(CGPoint)p inView:(UIView*)inView;
- (void)presentModalAtPoint:(CGPoint)p inView:(UIView*)inView animated:(BOOL)animated;

- (BOOL)shouldBeDismissedFor:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)dismiss;
- (void)dismiss:(BOOL)animtaed;
- (void)dismissModal;

- (void)addTarget:(id)target action:(SEL)action;
@end
