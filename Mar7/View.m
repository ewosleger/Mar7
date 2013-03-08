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
    	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		NSLog (@"SWIPE RIGHT %i", counter);
        
        direction = 1;
        [self setNeedsDisplay];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		NSLog (@"SWIPE LEFT %i", counter);
        
        direction = 0;
        
        [self setNeedsDisplay];
	} 
}

-(UIImage *)resizeImage:(UIImage *)image width:(int)width height:(int)height {
    NSLog(@"resizing");
    CGImageRef imageRef = [image CGImage];
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    
    //if (alphaInfo == kCGImageAlphaNone)
    alphaInfo = kCGImageAlphaNoneSkipLast;
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef),
                                                4 * width, CGImageGetColorSpace(imageRef), alphaInfo);
    CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}




 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
     CGPoint point = CGPointMake(0,0);
     UIImage *i = [_images objectAtIndex: counter];
     i = [self resizeImage:i width:self.bounds.size.width height: self.bounds.size.height];
     
     [i drawAtPoint: point blendMode:(kCGBlendModeNormal) alpha:(1)];
     
     if(direction == 1){
         if(counter+1 > [_images count]-1){
             counter = 1;
         }else{
             ++counter;
         }
     }else{
         if(counter-1 < 0){
             counter = [_images count]-1;
         }else{
             --counter;
         }
     }
     
 }


@end
