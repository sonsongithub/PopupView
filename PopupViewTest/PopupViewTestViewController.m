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

- (IBAction)pushButton:(id)sender {
	DNSLogMethod
	
	if (popup == nil) {
		if (currentMessageIndex == 0) {
			popup = [[SNPopupView alloc] initWithContentView:testContentView contentSize:CGSizeMake(203, 63)];
			currentMessageIndex++;
		}
		else if (currentMessageIndex == 1) {
			popup = [[SNPopupView alloc] initWithString:@"test message" withFontOfSize:29];
			currentMessageIndex++;
		}
		else if (currentMessageIndex == 2) {
			popup = [[SNPopupView alloc] initWithImage:[UIImage imageNamed:@"2tchSmall.png"]];
			currentMessageIndex = 0;
		}
		if (modalSwitch.on)
			[popup presentModalFromBarButtonItem:sender inView:self.view animated:animationSwitch.on];
		else
			[popup showFromBarButtonItem:sender inView:self.view animated:animationSwitch.on];
		[popup addTarget:self action:@selector(didTouchPopupView:)];
		[popup release];
		[popup setDelegate:self];
	}
	else if (!modalSwitch.on) {
		[popup dismiss:animationSwitch.on];
		popup = nil;
	}
}

- (void)didTouchPopupView:(SNPopupView*)sender {
	DNSLogMethod
	DNSLog(@"%@", sender);
}

- (void)didDismissModal:(SNPopupView*)popupview {
	DNSLogMethod
	if (popupview == popup) {
		popup = nil;
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	if (popup == nil) {
		if (currentMessageIndex == 0) {
			popup = [[SNPopupView alloc] initWithImage:[UIImage imageNamed:@"2tchSmall.png"]];
			currentMessageIndex++;
		}
		else if (currentMessageIndex == 1) {
			popup = [[SNPopupView alloc] initWithString:@"test message" withFontOfSize:16];
			currentMessageIndex++;
		}
		else if (currentMessageIndex == 2) {
			popup = [[SNPopupView alloc] initWithContentView:testContentView contentSize:CGSizeMake(203, 63)];
			currentMessageIndex = 0;
		}
		if (modalSwitch.on)
			[popup presentModalAtPoint:[touch locationInView:self.view] inView:self.view animated:animationSwitch.on];
		else
			[popup showAtPoint:[touch locationInView:self.view] inView:self.view animated:animationSwitch.on];
		[popup addTarget:self action:@selector(didTouchPopupView:)];
		[popup release];
		[popup setDelegate:self];
	}
	else if (!modalSwitch.on) {
		[popup dismiss:animationSwitch.on];
		popup = nil;
	}
}

- (void)dealloc {
	[messages release];
    [super dealloc];
}

@end
