//
//  PTMainWindowDelegate.h
//  Pwitter
//
//  Created by Akihiro Noguchi on 2/01/09.
//  Copyright 2009 Aki. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PTStatusBox.h"


@interface PTMainWindowDelegate : NSObject {
    IBOutlet id fMainWindow;
    IBOutlet id fMainActionHandler;
    IBOutlet id fMainController;
    IBOutlet id fStatusCollection;
	id fFieldEditor;
	PTStatusBox *fOldSelection;
}

@end
