//
//  ViewControllerSign.m
//  Iask Auditor
//
//  Created by KedarBrooks on 3/9/16.
//  Copyright (c) 2016 Iaskloud. All rights reserved.
//

#import "ViewControllerSign.h"
#import "AppDelegate.h"

@interface ViewControllerSign ()

@end

@implementation ViewControllerSign

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    drawImage.image = [defaults objectForKey:@"drawImageKey"];
    drawImage = [[UIImageView alloc] initWithImage:nil];
    drawImage.frame = self.view.frame;
    [self.view addSubview:drawImage];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([touch tapCount] == 2) {
        drawImage.image = nil;
    }
    
    location = [touch locationInView:touch.view];
    lastClick = [NSDate date];
    
    lastPoint = [touch locationInView:self.view];
    lastPoint.y -=0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped =YES;
    
    UITouch *touch = [touches anyObject];
    currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(CGSizeMake(768,388));
    [drawImage.image drawInRect:CGRectMake(0, 0, 768,388)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0,1, 0, 1);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    [drawImage setFrame:CGRectMake(0, 0, 768, 388)];
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
    
    [self.view addSubview:drawImage]; 
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SaveImage:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSString *matchnumber = appDelegate.Xmatchnumber;  //.. matchnumber read
    NSString *teamnumber = appDelegate.Xteamnumber; //.. teamnumbr read
    
    
    
    NSString *LocalAdressing = @"FRCRegional_X1_X2_TeleopFieldShots.jpg";
    
    LocalAdressing = [LocalAdressing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdressing = [LocalAdressing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    UIImage *image = viewImage;
    NSString  *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdressing];
    
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:path atomically:YES];
    NSLog(path); 
}
@end
