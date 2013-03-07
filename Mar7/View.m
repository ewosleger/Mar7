//
//  View.m
//  Mar7
//
//  Created by Edward Wosleger on 3/6/13.
//  Copyright (c) 2013 Edward Wosleger. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        //[self addSubview: textView];
        NSLog (@"initWithFrame method");
        _images = [[NSMutableArray alloc] initWithObjects:
                      [UIImage imageNamed:@"AgainstMe.JPG"],
                      [UIImage imageNamed:@"BloodyMary.jpg"],
                      [UIImage imageNamed:@"DKM.JPG"],
                      [UIImage imageNamed:@"PinkFloyd.JPG"],
                      [UIImage imageNamed:@"RustedRoot.JPG"],
                      [UIImage imageNamed:@"SociaD.JPG"],
                      [UIImage imageNamed:@"VNV_2012.jpg"],
                      nil];
        
		UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		
	}
	return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	//CGPoint p = [recognizer locationInView: self];
    NSLog (@"SWIPE");
    CGPoint point = CGPointMake(0,0);
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		NSLog (@"SWIPE RIGHT ");
        [[_images objectAtIndex: counter] drawAtPoint: point blendMode:(kCGBlendModeNormal) alpha:(1)];
        if(++counter > [_images count]){
            counter = 1;
        }else{
            ++counter;
        }
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		NSLog (@"SWIPE LEFT ");
        [[_images objectAtIndex: counter] drawAtPoint: point blendMode:(kCGBlendModeNormal) alpha:(1)];
        if(--counter < 1){
            [_images count];
        }else{
            --counter;
        }
	} 
}

       
	


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
