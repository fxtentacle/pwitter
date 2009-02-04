//
//  PTMenuBarIcon.m
//  Pwitter
//
//  Created by Akihiro Noguchi on 3/02/09.
//  Copyright 2009 Aki. All rights reserved.
//

// FROM ADIUM

#import "PTMenuBarIcon.h"
#import "PTMain.h"


@implementation PTMenuBarIcon

- (id)initWithFrame:(NSRect)aFrame {
    self = [super initWithFrame:aFrame];
    if (self) {
		fStatusItem = nil;
		fImage = nil;
		fAlternateImage = nil;
		fMainMenu = nil;
    }
    return self;
}

- (void)dealloc
{
	[fStatusItem release];
	[fImage release];
	[fAlternateImage release];
	[fMainMenu release];	
	[super dealloc];
}

- (void)drawRect:(NSRect)aRect
{
	[fStatusItem drawStatusBarBackgroundInRect:[self frame] withHighlight:fMouseDown];
	[fImage compositeToPoint:NSMakePoint(3, 3) operation: NSCompositeSourceOver];
}

- (void)displayMenu:(NSMenu *)aMenu
{
	fMouseDown = YES;
	[self display];
	[fStatusItem popUpStatusItemMenu:aMenu];
	fMouseDown = NO;
	[self setNeedsDisplay:YES];	
}

- (void)mouseDown:(NSEvent *)aEvent
{
	fMouseDown = YES;
	[self display];
	fMouseDown = NO;
	[self setNeedsDisplay:YES];
	[fMainController activateApp:self];
}

- (void)rightMouseDown:(NSEvent *)aEvent
{
	[self displayMenu:fMainMenu];
}

- (void)setImage:(NSImage *)aImage
{
	[fImage release];
	fImage = [aImage retain];
	
	if (!fMouseDown) {
		[self setNeedsDisplay:YES];
	}
}

- (NSImage *)image
{
	return fImage;
}

- (void)setMenu:(NSMenu *)aMenu
{
	[fMainMenu release];
	fMainMenu = [aMenu retain];
}

- (NSMenu *)menu
{
	return fMainMenu;
}

- (void)setStatusItem:(NSStatusItem *)aStatusItem
{
	[fStatusItem release];
	fStatusItem = [aStatusItem retain];
}

- (NSStatusItem *)statusItem
{
	return fStatusItem;
}

- (void)setMainController:(id)aMainController {
	fMainController = aMainController;
}

@end