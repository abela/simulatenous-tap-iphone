//
//  ViewController.m
//  doubletap
//
//  Created by MacBook on 5/22/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)expireTouchTime:(NSTimer*)timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    // touch count set to zero
    touchCount = 0;
    
    // desired touch tap interval - we will detect the intera
    touchInterval = 0.1f;
}

// expire touch time - if delay between touches is bigger than touchInterval, reset the timer and tpuch count
-(void)expireTouchTime:(NSTimer*)timer
{
    //
    //
    [touchTimer invalidate];
    touchTimer = nil;
    touchCount = 0;
    //
}

-(IBAction)buttonTouchDown:(id)sender
{
    // increase touch count
    touchCount++;
    
    switch (touchCount)
    {
            // if touch count is 1, lets run timer and wait to another touch in some time interval - touchInterval
        case 1:
        {
            touchTimer = [NSTimer scheduledTimerWithTimeInterval:touchInterval
                                             target:self
                                           selector:@selector(expireTouchTime:)
                                           userInfo:nil
                                            repeats:NO];
        }
        break;
        // if we already touched in given interval - count this is the double touch, reset the timer
        case 2:
        {
            [label setText:@"double touch !!!"];
            [touchTimer invalidate];
            touchTimer = nil;
        }
            break;
        default:
            break;
    }
}

// touch up - lets return touch count to 0 and set default text to label
-(IBAction)buttonTouchUp:(id)sender
{
    touchCount = 0;
    [label setText:@"..."];
}

@end
