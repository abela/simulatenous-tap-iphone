//
//  ViewController.h
//  doubletap
//
//  Created by MacBook on 5/22/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    @public
    IBOutlet UILabel *label;
    
@private
    int touchCount;
    float touchInterval;
    NSTimer *touchTimer;
}
@end

