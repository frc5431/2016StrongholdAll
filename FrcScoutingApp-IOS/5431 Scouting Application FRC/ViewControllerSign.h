//
//  ViewControllerSign.h
//  Iask Auditor
//
//  Created by KedarBrooks on 3/9/16.
//  Copyright (c) 2016 Iaskloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSign : UIViewController {
CGPoint lastPoint;
CGPoint moveBackTo;
CGPoint currentPoint;
CGPoint location;
NSDate *lastClick;
BOOL mouseSwiped;
UIImageView *drawImage;
UIImageView *frontImage;
}
- (IBAction)SaveImage:(id)sender;



@end
