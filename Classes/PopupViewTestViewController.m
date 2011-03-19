//
//  PopupViewTestViewController.m
//  PopupViewTest
//
//  Created by sonson on 10/10/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PopupViewTestViewController.h"

#import "SNPopupView.h"

@implementation PopupViewTestViewController

- (void)viewWillAppear:(BOOL)animated {
	messages = [NSArray arrayWithObjects:
				@"hoge",
				@"hoge",
				@"hoge",
				@"hoge",
				@"abcdaaaaaaaaaefghij",
				@"abcdaaaaaaaaaefghij",
				@"abcdaaaaaaaaaefghij",
				@"abcdaaaaaaaaaefghij",
				nil];
	[messages retain];
	
	currentMessageIndex = 0;
}

- (void)didTouchPopupView:(SNPopupView*)sender {
	DNSLogMethod
	DNSLog(@"%@", sender);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	NSString *nextTitle = [messages objectAtIndex:currentMessageIndex++];

	if (currentMessageIndex >= [messages count])
		currentMessageIndex = 0;
	
	if (popup == nil) {
		popup= [[SNPopupView alloc] initWithString:nextTitle];
		[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
		[popup addTarget:self action:@selector(didTouchPopupView:)];
		[popup release];
	}
	else {
		NSString *currentTitle = popup.title;
		
		if ([currentTitle isEqualToString:nextTitle]) {
			[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
		}
		else {
			[popup dismiss];
			popup = nil;
			
			popup= [[SNPopupView alloc] initWithString:nextTitle];
			[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
			[popup addTarget:self action:@selector(didTouchPopupView:)];
			[popup release];
		}
	}
}

- (void)dealloc {
	[messages release];
    [super dealloc];
}

@end
