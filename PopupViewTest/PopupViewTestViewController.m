/*
 * PopupView
 * PopupViewTestViewController.m
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
				@"pict",
				@"pict",
				@"pict",
				@"pict",
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
		if ([nextTitle isEqualToString:@"pict"])
			popup = [[SNPopupView alloc] initWithImage:[UIImage imageNamed:@"2tchSmall.png"]];
		else
			popup = [[SNPopupView alloc] initWithString:nextTitle];
		[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
		[popup addTarget:self action:@selector(didTouchPopupView:)];
		[popup release];
	}
	else {
		NSString *currentTitle = popup.title;
		
		if ([currentTitle isEqualToString:nextTitle]) {
			[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
		}
		else if (currentTitle == nil && [nextTitle isEqualToString:@"pict"]) {
			[popup showAtPoint:[touch locationInView:self.view] inView:self.view];
		}
		else {
			[popup dismiss];
			popup = nil;
			
			if ([nextTitle isEqualToString:@"pict"])
				popup = [[SNPopupView alloc] initWithImage:[UIImage imageNamed:@"2tchSmall.png"]];
			else
				popup = [[SNPopupView alloc] initWithString:nextTitle];
			
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
