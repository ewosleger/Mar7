//
//  Mar7AppDelegate.h
//  Mar7
//
//  Created by Edward Wosleger on 3/6/13.
//  Copyright (c) 2013 Edward Wosleger. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Mar7AppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end