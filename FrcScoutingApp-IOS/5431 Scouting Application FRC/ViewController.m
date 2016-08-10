//
//  ViewController.m
//  5431 Scouting Application FRC
//
//  Created for Titian Robotics Team 5431 on 1/27/16.
//  Copyright © 2016 Kedar Brooks. All rights reserved.
//

#import "ViewController.h"
#import "DBManager_Field.h"
#import "AppDelegate.h"


@interface ViewController ()
@end


NSString *teamnumber;
NSString *matchnumber;

// Create Field piece integer-string record ( Binary style ) # Start

// Auton Objects
bool run;
NSString *portStartValue = NULL;
NSString *portReachValue = NULL;
NSString *portCrossValue = NULL;

NSString *chevalStartValue = NULL;
NSString *chevalReachValue = NULL;
NSString *chevalCrossValue = NULL;

NSString *moatStartValue = NULL;
NSString *moatReachValue = NULL;
NSString *moatCrossValue = NULL;

NSString *rampartsStartValue = NULL;
NSString *rampartsReachValue = NULL;
NSString *rampartsCrossValue = NULL;

NSString *drawbridgeStartValue = NULL;
NSString *drawbridgeReachValue = NULL;
NSString *drawbridgeCrossValue = NULL;

NSString *sallyportStartValue = NULL;
NSString *sallyportReachValue = NULL;
NSString *sallyportCrossValue = NULL;

NSString *rockwallStartValue = NULL;
NSString *rockwallReachValue = NULL;
NSString *rockwallCrossValue = NULL;

NSString *roughterrainStartValue = NULL;
NSString *roughterrainReachValue = NULL;
NSString *roughterrainCrossValue = NULL;

NSString *lowbarStartValue = NULL;
NSString *lowbarReachValue = NULL;
NSString *lowbarCrossValue = NULL;

NSString *spyValue = NULL;
NSString *swbValue = NULL;
NSString *autonShotValue = NULL;
NSString *autonComments = NULL;
bool fullrun = NO;

// Tele 1

// Object declaration

// Tele-op Part one Objects
NSString *portScoreValue = NULL;
NSString *portAbilityValue = NULL;
NSString *chevalScoreValue = NULL;
NSString *chevalAbilityValue = NULL;
NSString *moatScoreValue = NULL;
NSString *moatAbilityValue = NULL;
NSString *rampartsScoreValue = NULL;
NSString *rampartsAbilityValue = NULL;
NSString *drawbridgeScoreValue = NULL;
NSString *drawbridgeAbilityValue = NULL;
NSString *sallyportScoreValue = NULL;
NSString *sallyportAbilityValue = NULL;
NSString *rockwallScoreValue = NULL;
NSString *rockwallAbilityValue = NULL;
NSString *roughScoreValue = NULL;
NSString *roughAbilityValue = NULL;
NSString *lowbarScoreValue = NULL;
NSString *lowbarAbilityValue = NULL;

// Tele-op HAPC 'Help a partner cross
NSString *HAPC_Port = NULL;
NSString *HAPC_Chev = NULL;
NSString *HAPC_Moat = NULL;
NSString *HAPC_Ramp = NULL;
NSString *HAPC_Draw = NULL;
NSString *HAPC_Sally = NULL;
NSString *HAPC_Rock = NULL;
NSString *HAPC_Rough = NULL;
NSString *HAPC_LowBar = NULL;

// Tele-op HTC 'Had trouble crossing'
NSString *HTC_Port = NULL;
NSString *HTC_Chev = NULL;
NSString *HTC_Moat = NULL;
NSString *HTC_Ramp = NULL;
NSString *HTC_Draw = NULL;
NSString *HTC_Sally = NULL;
NSString *HTC_Rock = NULL;
NSString *HTC_Rough = NULL;
NSString *HTC_Low = NULL;
NSString *teleopcomments;

// Teleop 2

NSString *LGS;
NSString *LGF;
NSString *HGS;
NSString *HGF;
NSString *TF;
NSString *scalled;
NSString *challanged;
NSString *WZA;
NSString *PD;
NSString *Teleopcomments2;

@implementation ViewController {
    bool *lowObjectsSelected;
    bool *roundone;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Tele_PortcullisValueTextField.text =[NSString stringWithFormat:@"%g",self.PortStepper.value];
    self.Tele_ChevalDeFriseValueTextField.text=[NSString stringWithFormat:@"%g",self.ChevalStepper.value];
    self.Tele_MoatValueTextField.text=[NSString stringWithFormat:@"%g",self.MoatStepper.value];
    self.Tele_RampartsValueTextField.text=[NSString stringWithFormat:@"%g",self.RamSteppers.value];
    self.Tele_DrawbridgeValueTextField.text=[NSString stringWithFormat:@"%g",self.DrawStepper.value];
    self.Tele_SallyPortValueTextField.text=[NSString stringWithFormat:@"%g",self.SallyStepper.value];
    self.Tele_RockWallValueTextField.text=[NSString stringWithFormat:@"%g",self.RockStepper.value];
    self.Tele_RoughTerrainValueTextField.text=[NSString stringWithFormat:@"%g",self.RoughStepper.value];
    self.Tele_LowBarValueTextField.text=[NSString stringWithFormat:@"%g",self.LowStepper.value];

    self.LGFTextField.text=[NSString stringWithFormat:@"%g",self.LGFStepper.value];
    self.LGSTextField.text=[NSString stringWithFormat:@"%g",self.LGSStepper.value];
    self.TF.text=[NSString stringWithFormat:@"%g",self.TFStepper.value];
    self.HGSTextField.text=[NSString stringWithFormat:@"%g",self.HGSStepper.value];
    self.HGFTextField.text=[NSString stringWithFormat:@"%g",self.HGFStepper.value];





    
    _autonCommentsTextView.delegate = self;
    _TeleopCommentsTextBox.delegate = self;
    _TeleopComments2TextBox.delegate = self;
  
    // Do any additional setup after loading the view, typically from a nib.
    // Load the html as a string from the file system

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAutonData:(id)sender {
    BOOL success = NO;
    
   

    
    // Create Field piece integer-string record ( Binary style ) # End

    /*
     Code Pattern base 1 : Object Check  ' depreciated ( March 28th 2016 )
     _________________________________
     This code sets to datastore value
     for pre-data write process.
     _________________________________
     if ( 'UIObject.state)
     {
     object = value ' on = 1 '
     }
     else
     {
     object = value ' off = 0 '
     }
     
     Code Pattern base 2 : Object Check '
     ________________________________________________________________________________
     This code sets the value of the value container (for example: 'portCrossValue' ) 
     from the UIobject on value which is a bool , which is converted into a long
     ________________________________________________________________________________
     value = [NSSString stringWithFormate @"%ld", (long)_UIObject.on];
     
     */
    
    //portCrossValue = [NSString stringWithFormat: @"%ld", (long)_PortStartedSwitch.on]; Will be in a new version
    
    
    // Auton object check
    if (_PortStartedSwitch.isOn)
    {
        portStartValue = @"1";
    }
    else
    {
        portStartValue = @"0";
    }
    if (_PortReachedSwitch.isOn)
    {
        portReachValue = @"1";
    }
    else
    {
        portReachValue = @"0";
    }
    if (_PortCrossedSwitch.isOn)
    {
        portCrossValue = @"1";
    }
    else
    {
        portCrossValue = @"0";
    }
    if (_ChevalStartedSwitch.isOn)
    {
        chevalStartValue = @"1";
    }
    else
    {
        chevalStartValue = @"0";
    }
    if (_ChevalReachedSwitch.isOn)
    {
        chevalReachValue = @"1";
    }
    else
    {
        chevalReachValue = @"0";
    }
    if (_ChevalCrossedSwitch.isOn)
    {
        chevalCrossValue = @"1";
    }
    else
    {
        chevalCrossValue = @"0";
    }
    if (_MoatStartedSwitch.isOn)
    {
        moatStartValue = @"1";
    }
    else
    {
        moatStartValue = @"0";
    }
    if (_MoatReachedSwitch.isOn)
    {
        moatReachValue = @"1";
    }
    else
    {
        moatReachValue = @"0";
    }
    if (_MoatCrossedSwitch.isOn)
    {
        moatCrossValue = @"1";
    }
    else
    {
        moatCrossValue = @"0";
    }
    if (_RampartsStartedSwitch.isOn)
    {
        rampartsStartValue = @"1";
    }
    else
    {
        rampartsStartValue = @"0";
    }
    if ( _RampartsReachedSwitch.isOn)
    {
        rampartsReachValue = @"1";
    }
    else
    {
        rampartsReachValue = @"0";
    }
    if (_RampartsCrossedSwitch.isOn)
    {
        rampartsCrossValue = @"1";
    }
    else
    {
        rampartsCrossValue = @"0";
    }
    if (_DrawbridgeStartedSwitch.isOn)
    {
        drawbridgeStartValue = @"1";
    }
    else
    {
        drawbridgeStartValue = @"0";
    }
    if (_DrawbridgeReachedSwitch.isOn)
    {
        drawbridgeReachValue = @"1";
    }
    else
    {
        drawbridgeReachValue = @"0";
    }
    if (_DrawbridgeCrossedSwitch.isOn)
    {
        drawbridgeCrossValue = @"1";
    }
    else
    {
        drawbridgeCrossValue = @"0";
    }
    if (_SallyportStartedSwitch.isOn)
    {
        sallyportStartValue = @"1";
    }
    else
    {
        sallyportStartValue = @"0";
    }
    if (_SallyportReachedSwitch)
    {
        sallyportReachValue = @"1";
    }
    else
    {
        sallyportReachValue = @"0";
    }
    if (_SallyportCrossedSwitch.isOn)
    {
        sallyportCrossValue = @"1";
    }
    else
    {
        sallyportCrossValue = @"0";
    }
    if (_RockwallStartedSwitch.isOn)
    {
        rockwallStartValue = @"1";
    }
    else
    {
        rockwallStartValue = @"0";
    }
    if (_RockwallReachedSwitch.isOn)
    {
        rockwallReachValue = @"1";
    }
    else
    {
        rockwallReachValue = @"0";
    }
    if (_RockwallCrossedSwitch.isOn)
    {
        rockwallCrossValue = @"1";
    }
    else
    {
        rockwallCrossValue = @"0";
    }
    if ( _RoughTerrainStartedSwitch.isOn)
    {
        roughterrainStartValue = @"1";
    }
    else
    {
        roughterrainStartValue = @"0";
    }
    if (_RoughTerrainReachedSwitch.isOn)
    {
        roughterrainReachValue = @"1";
    }
    else
    {
        roughterrainReachValue = @"0";
    }
    if ( _RoughTerrainCrossedSwitch.isOn)
    {
        roughterrainCrossValue = @"1";
    }
    else
    {
        roughterrainCrossValue = @"0";
    }
    if (_LowbarStartedSwitch.isOn)
    {
        lowbarStartValue = @"1";
    }
    else
    {
        lowbarStartValue = @"0";
    }
    if (_LowbarReachedSwitch.isOn)
    {
        lowbarReachValue = @"1";
    }
    else
    {
        lowbarReachValue = @"0";
    }
    if (_LowbarCrossedSwitch.isOn)
    {
        lowbarCrossValue = @"1";
    }
    {
        lowbarCrossValue = @"0";
    }
    if (_spybotSeg.selectedSegmentIndex == 0)
    {
        spyValue = @"0";
    }
    else if
        (_spybotSeg.selectedSegmentIndex == 1)
    {
        spyValue = @"1";
    }
    else
    {
        spyValue = @"false";
    }
    if (_swbSeg.selectedSegmentIndex ==0) {
        swbValue = @"0";
    }
    else if (_swbSeg.selectedSegmentIndex ==1) {
        swbValue =@"1";
    }
    else
    {
        swbValue =@"false"; 
    }
    // End of Auton

    
    NSString *alertString_F = @"Auton Data Insertion failed";
    NSString *alertString_S = @"Auton Data was Archived Succesfully";
    
        
        NSString *dataFile = [[NSBundle mainBundle] pathForResource:@"FRCRegional_X1_X2_Auton" ofType:@"dbs"];
        NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    
    if (_TeamNumberTextView.text.length>0 &&_MatchNumberTextView.text.length>0)
    {
        // Portcullis Auton Section
        if ([contents rangeOfString:@"A1"].location == NSNotFound) {
                        NSLog(@"string does not contain A1");
        }
        else
        {
        contents = [contents stringByReplacingOccurrencesOfString:@"A1"
                                                        withString:portStartValue];
        }
        if ([contents rangeOfString:@"A2"].location == NSNotFound) {
            NSLog(@"string does not contain A2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A2"
                                                           withString:portReachValue];
        }
        if ([contents rangeOfString:@"A3"].location == NSNotFound) {
            NSLog(@"string does not contain A3");

        }
        else {
            contents = [contents stringByReplacingOccurrencesOfString:@"A3"
                                                           withString:portCrossValue];
        }
        // cheval de frise Auton section
        if ([contents rangeOfString:@"A4"].location == NSNotFound) {
            NSLog(@"string does not contain A4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A4"
                                                           withString:chevalStartValue];
        }
        if ([contents rangeOfString:@"A5"].location == NSNotFound) {
            NSLog(@"string does not contain A5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A5"
                                                           withString:chevalReachValue];
        }
        if ([contents rangeOfString:@"A6"].location == NSNotFound) {
            NSLog(@"string does not contain A6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A6"
                                                           withString:chevalCrossValue];
        }
        // Moat Auton Section

        if ([contents rangeOfString:@"A7"].location == NSNotFound) {
            NSLog(@"string does not contain A7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A7"
                                                           withString:moatStartValue];
        }
        if ([contents rangeOfString:@"A8"].location == NSNotFound) {
            NSLog(@"string does not contain A8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A8"
                                                           withString:moatReachValue];
        }
        if ([contents rangeOfString:@"A9"].location == NSNotFound) {
            NSLog(@"string does not contain A9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A9"
                                                           withString:moatCrossValue];
        }
        // Ramparts Auton Section
        if ([contents rangeOfString:@"B1"].location == NSNotFound) {
            NSLog(@"string does not contain B1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B1"
                                                           withString:rampartsStartValue];
        }
        if ([contents rangeOfString:@"B2"].location == NSNotFound) {
            NSLog(@"string does not contain B2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B2"
                                                           withString:rampartsReachValue];
        }
        if ([contents rangeOfString:@"B3"].location == NSNotFound) {
            NSLog(@"string does not contain B3");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B3"
                                                           withString:rampartsCrossValue];
        }
        // Drawbridge Auton Section
        if ([contents rangeOfString:@"B4"].location == NSNotFound) {
            NSLog(@"string does not contain B4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B4"
                                                           withString:drawbridgeStartValue];
        }
        if ([contents rangeOfString:@"B5"].location == NSNotFound) {
            NSLog(@"string does not contain B5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B5"
                                                           withString:drawbridgeReachValue];
        }
        if ([contents rangeOfString:@"B6"].location == NSNotFound) {
            NSLog(@"string does not contain B6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B6"
                                                           withString:drawbridgeCrossValue];
        }
        // Sally Port Auton Section
        if ([contents rangeOfString:@"B7"].location == NSNotFound) {
            NSLog(@"string does not contain B7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B7"
                                                           withString:sallyportStartValue];
        }
        if ([contents rangeOfString:@"B8"].location == NSNotFound) {
            NSLog(@"string does not contain B8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B8"
                                                           withString:sallyportReachValue];
        }
        if ([contents rangeOfString:@"B9"].location == NSNotFound) {
            NSLog(@"string does not contain B9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B9"
                                                           withString:sallyportCrossValue];
        }
        // RockWall Auton Section
        if ([contents rangeOfString:@"C1"].location == NSNotFound) {
            NSLog(@"string does not contain C1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C1"
                                                           withString:rockwallStartValue];
        }
        if ([contents rangeOfString:@"C2"].location == NSNotFound) {
            NSLog(@"string does not contain C2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C2"
                                                           withString:rockwallReachValue];
        }
        if ([contents rangeOfString:@"C3"].location == NSNotFound) {
            NSLog(@"string does not contain C3");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C3"
                                                           withString:rockwallCrossValue];
        }
        // Rough Terrain Auton Section 
        if ([contents rangeOfString:@"C4"].location == NSNotFound) {
            NSLog(@"string does not contain C4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C4"
                                                           withString:roughterrainStartValue];
        }
        if ([contents rangeOfString:@"C5"].location == NSNotFound) {
            NSLog(@"string does not contain C5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C5"
                                                           withString:roughterrainReachValue];
        }
        if ([contents rangeOfString:@"C6"].location == NSNotFound) {
            NSLog(@"string does not contain C6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C6"
                                                           withString:roughterrainCrossValue];
        }
        // Lowbar Auton Section
        if ([contents rangeOfString:@"C7"].location == NSNotFound) {
            NSLog(@"string does not contain C7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C7"
                                                           withString:lowbarStartValue];
        }
        if ([contents rangeOfString:@"C8"].location == NSNotFound) {
            NSLog(@"string does not contain C8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C8"
                                                           withString:lowbarReachValue];
        }
        if ([contents rangeOfString:@"C9"].location == NSNotFound) {
            NSLog(@"string does not contain C9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C9"
                                                           withString:lowbarCrossValue];
        }
        // Spybot Value Section
        if ([contents rangeOfString:@"D1"].location == NSNotFound) {
            NSLog(@"string does not contain D1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"D1"
                                                           withString:spyValue];
        }
        // Started With Ball value section
        if ([contents rangeOfString:@"D2"].location == NSNotFound) {
            NSLog(@"string does not contain D2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"D2"
                                                           withString:swbValue];
        }
        NSLog(@"Failed to write");
        
    }
    
    autonComments = _autonCommentsTextView.text;
    contents = [contents stringByReplacingOccurrencesOfString:@"D3"
                                                   withString:autonComments];
    autonShotValue = [NSString stringWithFormat:@"%ld", (long) _AutoShot.selectedSegmentIndex];
    contents = [contents stringByReplacingOccurrencesOfString:@"D4" withString:autonShotValue];
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopOneView"];
    
    success = YES;
    if (success == YES)
    {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Data Saved"
                                    message:@"Auton Report was successfully archived"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Move to Teleop"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self presentViewController:vc animated:YES completion:nil];



                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Make Edits"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if (success == NO) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Data not savd"
                                      message:@"Your data was not saved sucessfully"
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action) {
                                                             }];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    

    
    // Write New File
    
    matchnumber = _MatchNumberTextView.text;
    teamnumber = _TeamNumberTextView.text;
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    appDelegate.Xmatchnumber = _MatchNumberTextView.text;     //..to write matchnumber
    appDelegate.Xteamnumber = _TeamNumberTextView.text;       //..to write teamnumber
    
    contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                   withString:matchnumber];
    contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSLog(contents);
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2_Auton.dbs");
    
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSError *error;
    NSString *stringToWrite = contents;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdreessing];
    [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(contents);
    NSLog(filePath);
    
   
    
    
    
    // [dataFile writeToFile:(@"Documents\FRCRegional_", teamnumber, "_" , matchnumber)atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

- (IBAction)saveTeleopDataOne:(id)sender {
    
    /*
     Code Pattern : Object Check
     _________________________________
     This code sets to datastore value 
     for pre-data write process.
     Only applies for 'if' checks.
     _________________________________
     if ( 'UIObject.state)
     {
     object = value ' on = 1 '
     }
     else
     {
     object = value ' off = 0 '
     }
     
     */
    
    
    
    // Start of Teleop object check
    
    //Setup String Values
    //Setup String Values
    portScoreValue = _Tele_PortcullisValueTextField.text;
    chevalScoreValue = _Tele_ChevalDeFriseValueTextField.text;
    moatScoreValue = _Tele_MoatValueTextField.text;
    rampartsScoreValue = _Tele_RampartsValueTextField.text;
    drawbridgeScoreValue = _Tele_RampartsValueTextField.text;
    sallyportScoreValue = _Tele_SallyPortValueTextField.text;
    rockwallScoreValue = _Tele_RockWallValueTextField.text;
    roughScoreValue = _Tele_RoughTerrainValueTextField.text;
    lowbarScoreValue = _Tele_LowBarValueTextField.text;
    
    //Setup Segment values
    portAbilityValue = [NSString stringWithFormat: @"%ld", (long) _Tele_PortcullisAbilitySeg.selectedSegmentIndex];
    chevalAbilityValue = [NSString stringWithFormat: @"%ld" ,(long) _Tele_ChevalDeFriseAbilitySeg.selectedSegmentIndex];
    moatAbilityValue = [NSString stringWithFormat : @"%ld",(long) _Tele_MoatAbilitySeg.selectedSegmentIndex];
    rampartsAbilityValue = [NSString stringWithFormat: @"%ld", (long)_Tele_RampartsAbilitySeg.selectedSegmentIndex];
    drawbridgeAbilityValue = [NSString stringWithFormat:@"%ld" , (long)_Tele_DrawbridgeAbilitySeg.selectedSegmentIndex];
    sallyportAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_SallyPortAbilitySeg.selectedSegmentIndex];
    rockwallAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RockWallAbilitySeg.selectedSegmentIndex];
    roughAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RoughTerranAbilitySeg.selectedSegmentIndex];
    lowbarAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_LowBarAbilitySeg.selectedSegmentIndex];
    
    //Setup Teleop HAPC object check
    HAPC_Port = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_PortSwitch.on];
    HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
    HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
    HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
    HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
    HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
    HAPC_Rock = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RockSwitch.on];
    HAPC_Rough = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RoughSwitch.on];
    HAPC_LowBar = [NSString stringWithFormat:@"%ld" , (long)_HAPC_Tele_LowBarSwitch.on];
    
    //Setup Teleop HTC object check
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_MoatSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_RampSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    // End o Teleop object check
    
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2");
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:@"FRCRegional_X1_X2_Teleop1" ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    
    // Logical Processing
    if ([contents rangeOfString:@"E1"].location == NSNotFound) {
        NSLog(@"string does not contain E1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E1"
                                                       withString:portScoreValue];
    }
    if ([contents rangeOfString:@"J1"].location == NSNotFound) {
        NSLog(@"string does not contain J1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J1"
                                                       withString:portAbilityValue];
    }
    if ([contents rangeOfString:@"E2"].location == NSNotFound) {
        NSLog(@"string does not contain E2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E2.1" withString:chevalScoreValue];
    }
    if ([contents rangeOfString:@"J2"].location == NSNotFound) {
        NSLog(@"string does not contain J2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J2" withString:chevalAbilityValue];
    }
    if ([contents rangeOfString:@"E3"].location ==NSNotFound) {
        NSLog(@"string does not contain E3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E3" withString:moatScoreValue];
    }
    if ([contents rangeOfString:@"J3"].location ==NSNotFound) {
        NSLog(@"string does not contain J3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J3" withString:moatAbilityValue];
    }
    if ([contents rangeOfString:@"E4"].location ==NSNotFound) {
        NSLog(@"string does not contain E4");
    }
    else
    {
        contents= [contents stringByReplacingOccurrencesOfString:@"E4" withString:rampartsScoreValue];
    }
    if ([contents rangeOfString:@"J4"].location ==NSNotFound) {
        NSLog(@"string does not contain J4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J4" withString:rampartsAbilityValue];
    }
    if ([contents rangeOfString:@"E5"].location ==NSNotFound) {
        NSLog(@"string does not contain E5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E5" withString:drawbridgeScoreValue];
    }
    if ([contents rangeOfString:@"J5"].location ==NSNotFound) {
        NSLog(@"string does not contain J5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J5" withString:drawbridgeAbilityValue];
    }
    if ([contents rangeOfString:@"E6"].location == NSNotFound) {
        NSLog(@"string does not contain E6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E6" withString:sallyportScoreValue];
    }
    if ([contents rangeOfString:@"J6"].location ==NSNotFound) {
        NSLog(@"string does not contain J6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J6" withString:sallyportAbilityValue];
    }
    if ([contents rangeOfString:@"E7"].location ==NSNotFound) {
        NSLog(@"string does not contain E7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E7" withString:rockwallScoreValue];
    }
    if ([contents rangeOfString:@"J7"].location ==NSNotFound) {
        NSLog(@"string does not contain J7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J7" withString:rockwallAbilityValue];
    }
    if ([contents rangeOfString:@"E8"].location ==NSNotFound) {
        NSLog(@"string does not contain E8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E8" withString:roughScoreValue];
    }
    if ([contents rangeOfString:@"J8"].location ==NSNotFound) {
        NSLog(@"string does not contain j8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J8" withString:roughAbilityValue];
    }
    if ([contents rangeOfString:@"E9"].location ==NSNotFound) {
        NSLog(@"string does not contain E9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E9" withString:lowbarScoreValue];
    }
    if ([contents rangeOfString:@"J9"].location ==NSNotFound) {
        NSLog(@"string does not contain J9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J9" withString:lowbarAbilityValue];
    }
    if ([contents rangeOfString:@"P1"].location ==NSNotFound) {
        NSLog(@"string does not contain P1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"P1" withString:_TeleopCommentsTextBox.text];
    }
    
    
    
    // HAPC variable addresing
    /*
     
     This section was removed for continuity reasons
     
     HAPC_Port = [NSString stringWithFormat: @"%ld", (long)_HAPC_Tele_PortSwitch.on];
     HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
     HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
     HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
     HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
     HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
     HAPC_Rock = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RockSwitch.on];
     HAPC_Rough = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RoughSwitch.on];
     HAPC_LowBar = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_LowBarSwitch.on];
     */
    
    //HTC variable addressing
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_ChevSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RampSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_MoatSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    
    
    // HAPC and HTC Logical processing
    NSString *alertString_F = @"teleop Data Insertion failed";
    NSString *alertString_S = @"teleop Data was Archived Succesfully";
    bool success;
    success = YES;
    
    
    if ([contents rangeOfString:@"F1"].location == NSNotFound) {
        NSLog(@"string does not contain F1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F1"
                                                       withString:HAPC_Port];
    }
    if ([contents rangeOfString:@"F2"].location == NSNotFound) {
        NSLog(@"string does not contain F2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F2"
                                                       withString:HAPC_Chev];
    }
    if ([contents rangeOfString:@"F3"].location == NSNotFound) {
        NSLog(@"string does not contain F3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F3"
                                                       withString:HAPC_Moat];
    }
    if ([contents rangeOfString:@"F4"].location == NSNotFound) {
        NSLog(@"string does not contain F4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F4"
                                                       withString:HAPC_Ramp];
    }
    if ([contents rangeOfString:@"F5"].location == NSNotFound) {
        NSLog(@"string does not contain F5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F5"
                                                       withString:HAPC_Draw];
    }
    if ([contents rangeOfString:@"F6"].location == NSNotFound) {
        NSLog(@"string does not contain F6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F6"
                                                       withString:HAPC_Sally];
    }
    if ([contents rangeOfString:@"F7"].location == NSNotFound) {
        NSLog(@"string does not contain F7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F7"
                                                       withString:HAPC_Rock];
    }
    if ([contents rangeOfString:@"F8"].location == NSNotFound) {
        NSLog(@"string does not contain F8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F8"
                                                       withString:HAPC_Rough];
    }
    if ([contents rangeOfString:@"F9"].location == NSNotFound) {
        NSLog(@"string does not contain F9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F9"
                                                       withString:HAPC_LowBar];
    }
    if ([contents rangeOfString:@"G1"].location == NSNotFound) {
        NSLog(@"string does not contain G1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G1"
                                                       withString:HTC_Port];
        
    }
    if ([contents rangeOfString:@"G2"].location == NSNotFound) {
        NSLog(@"string does not contain G2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G2"
                                                       withString:HTC_Chev];
    }
    if ([contents rangeOfString:@"G3"].location == NSNotFound) {
        NSLog(@"string does not contain G3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G3"
                                                       withString:HTC_Moat];
    }
    if ([contents rangeOfString:@"G4"].location == NSNotFound) {
        NSLog(@"string does not contain G4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G4"
                                                       withString:HTC_Ramp];
    }
    if ([contents rangeOfString:@"G5"].location == NSNotFound) {
        NSLog(@"string does not contain G5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G5"
                                                       withString:HTC_Draw];
    }
    if ([contents rangeOfString:@"G6"].location == NSNotFound) {
        NSLog(@"string does not contain G6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G6"
                                                       withString:HTC_Sally];
    }
    if ([contents rangeOfString:@"G7"].location == NSNotFound) {
        NSLog(@"string does not contain G7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G7"
                                                       withString:HTC_Rock];
    }
    if ([contents rangeOfString:@"G8"].location == NSNotFound) {
        NSLog(@"string does not contain G8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G8"
                                                       withString:HTC_Rough];
    }
    if ([contents rangeOfString:@"G9"].location == NSNotFound) {
        NSLog(@"string does not contain G9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G9"
                                                       withString:HTC_Low];
        
    }
    // Write Status
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopTwoView"];
    success = YES;
    
    if (success == YES)
    {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Data Saved"
                                    message:@"Teleop Part 1 Report was successfully archived"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Move to Teleop Part 2"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self presentViewController:vc animated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Make Edits"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
        teleopcomments = _TeleopCommentsTextBox.text; 
    
    
    
    NSLog(@"Write Cycle 2");
    NSError *error;
    
    NSString *LocalAdressing = @"FRCRegional_X1_X2_Teleop1.dbs";
    LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                   withString:matchnumber];
    contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSString *stringToWrite = contents;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdressing];
    
    [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(contents);
    NSLog(filePath);
    NSLog(matchnumber);
    NSLog(teamnumber);
}
}

- (IBAction)SaveTeleop2Data:(id)sender {
    

    
    // Assign Values
    // Assign Values
    LGS = _LGSTextField.text;
    LGF = _LGFTextField.text;
    HGF = _LGFTextField.text;
    HGS = _HGSTextField.text;
    TF = _TF.text;
    scalled = [NSString stringWithFormat: @"%ld", (long)_ScalledSeg.selectedSegmentIndex];
    challanged = [NSString stringWithFormat:@"%ld", (long)_ChallangedSeg.selectedSegmentIndex];
    WZA = [NSString stringWithFormat:@"%ld", (long)_WZASeg.selectedSegmentIndex];
    PD = [NSString stringWithFormat:@"%ld", (long)_PDSwitch.on];
    Teleopcomments2 = _TeleopComments2TextBox.text;
    
    //Prepare for Write
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2_Teleop2");
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:LocalAdreessing ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    bool success;
    
    // Variable Write
    if ([contents rangeOfString:@"H1"].location == NSNotFound) {
        NSLog(@"string does not contain H1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H1"
                                                       withString:LGS];
    }
    if ([contents rangeOfString:@"H2"].location == NSNotFound) {
        NSLog(@"string does not contain H2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H2"
                                                       withString:LGF];
    }
    if ([contents rangeOfString:@"H3"].location == NSNotFound) {
        NSLog(@"string does not contain H3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H3"
                                                       withString:HGS];
    }
    if ([contents rangeOfString:@"H4"].location == NSNotFound) {
        NSLog(@"string does not contain H4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H4"
                                                       withString:HGF];
    }
    if ([contents rangeOfString:@"H5"].location == NSNotFound) {
        NSLog(@"string does not contain H5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H5"
                                                       withString:scalled];
    }
    if ([contents rangeOfString:@"H6"].location == NSNotFound) {
        NSLog(@"string does not contain H6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H6"
                                                       withString:challanged];
    }
    if ([contents rangeOfString:@"H7"].location == NSNotFound) {
        NSLog(@"string does not contain H7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H7"
                                                       withString:TF];
    }
    if ([contents rangeOfString:@"H8"].location == NSNotFound) {
        NSLog(@"string does not contain H8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H8"
                                                       withString:Teleopcomments2];
    }
    if ([contents rangeOfString:@"H9"].location == NSNotFound) {
        NSLog(@"string does not contain H9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H9"
                                                       withString:PD];
        success = YES;
    }
    NSString *alertString_F = @"teleop2 Data Insertion failed";
    NSString *alertString_S = @"teleop2 Data was Archived Succesfully, T";

    // Write Status
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"Home"];
    
    success = YES;
    if (success == YES)
    {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Data Saved"
                                    message:@"Teleop Part 2 Report was successfully archived"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Go to Dashboard"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self presentViewController:vc animated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Make Edits"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    
    
    NSLog(@"Write Cycle 3");
    NSError *error;
    LocalAdreessing = [ LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [ LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                   withString:matchnumber];
    contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    LocalAdreessing = [ LocalAdreessing stringByAppendingString:@".dbs"];
    NSString *stringToWrite = contents;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdreessing];
    
    [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(contents);
    NSLog(filePath);fullrun = YES;
}

- (IBAction)LGFPressed:(id)sender {
    self.LGFTextField.text=[NSString stringWithFormat:@"%g",self.LGFStepper.value];
}

- (IBAction)LGSPressed:(id)sender {
    self.LGSTextField.text=[NSString stringWithFormat:@"%g",self.LGSStepper.value];
}

- (IBAction)TFPressed:(id)sender {
    self.TF.text=[NSString stringWithFormat:@"%g",self.TFStepper.value];
}

- (IBAction)HGFPressed:(id)sender {
    self.HGFTextField.text=[NSString stringWithFormat:@"%g",self.HGFStepper.value];
}

- (IBAction)HGSPressed:(id)sender {
    self.HGSTextField.text=[NSString stringWithFormat:@"%g",self.HGSStepper.value];
}

- (IBAction)AutonBack:(id)sender {

    _MatchNumberTextView.text = matchnumber;
    _TeamNumberTextView.text = teamnumber;
    
    
    if ([portStartValue  isEqualToString: @"1"])
    {
        _PortStartedSwitch.on = YES;
    }
    else
    {
        _PortStartedSwitch.on = NO;
    }
    if ([portReachValue isEqualToString:@"1"])
    {
        _PortReachedSwitch.on = YES;
    }
    else
    {
        _PortReachedSwitch.on = NO;
    }
    if ([portCrossValue isEqualToString:@"1"])
    {
        _PortCrossedSwitch.on = YES;
    }
    else
    {
        _PortCrossedSwitch.on = NO;
    }
    if ([chevalStartValue isEqualToString:@"1"])
    {
        _ChevalStartedSwitch.on = YES;
    }
    else
    {
        _ChevalStartedSwitch.on = NO;
    }
    if ([chevalReachValue isEqualToString:@"1"])
    {
        _ChevalReachedSwitch.on = YES;
    }
    else
    {
        _ChevalReachedSwitch.on = NO;
    }
    if ([chevalCrossValue isEqualToString:@"1"])
    {
        _ChevalCrossedSwitch.on = YES;
    }
    else
    {
        _ChevalCrossedSwitch.on = NO;
    }
    if ([moatStartValue isEqualToString:@"1"])
    {
        _MoatStartedSwitch.on = YES;
    }
    else
    {
        _MoatStartedSwitch.on = NO;
    }
    if ([moatReachValue isEqualToString:@"1"])
    {
        _MoatReachedSwitch.on = YES;
    }
    else
    {
        _MoatReachedSwitch.on = NO;
    }
    if ([moatCrossValue isEqualToString:@"1"])
    {
        _MoatCrossedSwitch.on = YES;
    }
    else
    {
        _MoatCrossedSwitch.on = NO;
    }
    if ([rampartsStartValue isEqualToString:@"1"])
    {
        _RampartsStartedSwitch.on = YES;
    }
    else
    {
        _RampartsStartedSwitch.on = NO;
    }
    if ([rampartsReachValue isEqualToString:@"1"])
    {
        _RampartsReachedSwitch.on = YES;
    }
    else
    {
        _RampartsReachedSwitch.on = NO;
    }
    if ([rampartsCrossValue isEqualToString:@"1"])
    {
        _RampartsCrossedSwitch.on = YES;
    }
    else
    {
        _RampartsCrossedSwitch.on = NO;
    }
    if ([drawbridgeStartValue isEqualToString:@"1"])
    {
        _DrawbridgeStartedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeStartedSwitch.on = NO;
    }
    if ([drawbridgeReachValue isEqualToString:@"1"])
    {
        _DrawbridgeReachedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeReachedSwitch.on = NO;
    }
    if ([drawbridgeCrossValue isEqualToString:@"1"])
    {
        _DrawbridgeCrossedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeCrossedSwitch.on = NO;
    }
    if ([sallyportStartValue isEqualToString:@"1"])
    {
        _SallyportStartedSwitch.on = YES;
    }
    else
    {
        _SallyportStartedSwitch.on = NO;
    }
    if ([sallyportReachValue isEqualToString:@"1"])
    {
        _SallyportReachedSwitch.on = YES;
    }
    else
    {
        _SallyportReachedSwitch.on = NO;
    }
    if ([sallyportCrossValue isEqualToString:@"1"])
    {
        _SallyportCrossedSwitch.on = YES;
    }
    else
    {
        _SallyportCrossedSwitch.on = NO;
    }
    if ([rockwallStartValue isEqualToString:@"1"])
    {
        _RockwallStartedSwitch.on = YES;
    }
    else
    {
        _RockwallStartedSwitch.on = NO;
    }
    if ([rockwallReachValue isEqualToString:@"1"])
    {
        _RockwallReachedSwitch.on = YES;
    }
    else
    {
        _RockwallReachedSwitch.on = NO;
    }
    if ([rockwallCrossValue isEqualToString:@"1"])
    {
        _RockwallCrossedSwitch.on = YES;
    }
    else
    {
        _RockwallCrossedSwitch.on = NO;
    }
    if ([roughterrainStartValue isEqualToString:@"1"])
    {
        _RoughTerrainStartedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainStartedSwitch.on = NO;
    }
    if ([roughterrainReachValue isEqualToString:@"1"])
    {
        _RoughTerrainReachedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainReachedSwitch.on = NO;
    }
    if ([roughterrainCrossValue isEqualToString:@"1"])
    {
        _RoughTerrainCrossedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainCrossedSwitch.on = NO;
    }
    if ([lowbarStartValue isEqualToString:@"1"])
    {
        _LowbarStartedSwitch.on = YES;
    }
    else
    {
        _LowbarStartedSwitch.on = NO;
    }
    if ([lowbarReachValue isEqualToString:@"1"])
    {
        _LowbarReachedSwitch.on = YES;
    }
    else
    {
        _LowbarReachedSwitch.on = NO;
    }
    if ([lowbarCrossValue isEqualToString:@"1"])
    {
        _LowbarCrossedSwitch.on = YES;
    }
    else
    {
        _LowbarCrossedSwitch.on = NO;
    }
    
    _spybotSeg.selectedSegmentIndex = [ spyValue integerValue];
    _swbSeg.selectedSegmentIndex = [ swbValue integerValue];
    _autonCommentsTextView.text = autonComments;
    _AutoShot.selectedSegmentIndex = [autonShotValue integerValue];
    

 
}

- (IBAction)Teleop1Back:(id)sender {
    
    _Tele_PortcullisValueTextField.text = portScoreValue;
    _Tele_ChevalDeFriseValueTextField.text = chevalScoreValue;
    _Tele_MoatValueTextField.text = moatScoreValue;
    _Tele_RampartsValueTextField.text = rampartsScoreValue;
    _Tele_DrawbridgeValueTextField.text = drawbridgeScoreValue;
    _Tele_SallyPortValueTextField.text = sallyportScoreValue;
    _Tele_RockWallValueTextField.text = rockwallScoreValue;
    _Tele_RoughTerrainValueTextField.text = roughScoreValue;
    _Tele_LowBarValueTextField.text = lowbarScoreValue;
    
    _Tele_PortcullisAbilitySeg.selectedSegmentIndex = [portAbilityValue integerValue];
    _Tele_ChevalDeFriseAbilitySeg.selectedSegmentIndex = [chevalAbilityValue integerValue];
    _Tele_MoatAbilitySeg.selectedSegmentIndex = [moatAbilityValue integerValue];
    _Tele_RampartsAbilitySeg.selectedSegmentIndex = [rampartsAbilityValue integerValue];
    _Tele_DrawbridgeAbilitySeg.selectedSegmentIndex = [drawbridgeAbilityValue integerValue];
    _Tele_SallyPortAbilitySeg.selectedSegmentIndex = [sallyportAbilityValue integerValue];
    _Tele_RockWallAbilitySeg.selectedSegmentIndex = [rockwallAbilityValue integerValue];
    _Tele_RoughTerranAbilitySeg.selectedSegmentIndex = [roughAbilityValue integerValue];
    _Tele_LowBarAbilitySeg.selectedSegmentIndex = [lowbarAbilityValue integerValue];
    
    if ([HTC_Port isEqualToString:@"1"]) {
        _HTC_ele_PortSwitch.on = YES;
    }
    else
    {
        _HTC_ele_PortSwitch.on = NO;
    }
    if([HTC_Chev isEqualToString:@"1"]) {
        _HTC_Tele_ChevSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_ChevSwitch.on = NO;
    }
    if([HTC_Moat isEqualToString:@"1"]) {
        _HTC_Tele_MoatSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_MoatSwitch.on = NO;
    }
    if([HTC_Ramp isEqualToString:@"1"]) {
        _HTC_Tele_RampSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RampSwitch.on = NO;
    }
    if([HTC_Draw isEqualToString:@"1"]) {
        _HTC_Tele_DrawSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_DrawSwitch.on = NO;
    }
    if([HTC_Sally isEqualToString:@"1"]) {
        _HTC_Tele_SallySwitch.on = YES;
    }
    else
    {
        _HTC_Tele_SallySwitch.on = NO;
    }
    if([HTC_Rock isEqualToString:@"1"]) {
        _HTC_Tele_RockSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RockSwitch.on = NO;
    }
    if([HTC_Rough isEqualToString:@"1"]) {
        _HTC_Tele_RoughSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RoughSwitch.on = NO;
    }
    if([HTC_Low isEqualToString:@"1"]) {
        _HTC_Tele_LowBarSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_LowBarSwitch.on = NO;
    }
    _TeleopCommentsTextBox.text = teleopcomments;
}

- (IBAction)Teleop2Back:(id)sender {
 
    _LGSTextField.text = LGS;
    _LGFTextField.text = LGF;
    _HGSTextField.text = HGS;
    _HGFTextField.text = HGF;
    _TF.text = TF;
    
    _ScalledSeg.selectedSegmentIndex = [scalled integerValue];
    _ChallangedSeg.selectedSegmentIndex = [challanged integerValue];
    _WZASeg.selectedSegmentIndex = [WZA integerValue];
    _TeleopCommentsTextBox.text = Teleopcomments2;
    
    if ([PD isEqualToString:@"1"]) {
        _PDSwitch.on = YES;
    }
    else
    {
        _PDSwitch.on = NO; 
    }
    
    _TeleopComments2TextBox.text = Teleopcomments2;
    
}

- (IBAction)Teleop2Backsave:(id)sender;
{
    // Assign Values
    LGS = _LGSTextField.text;
    LGF = _LGFTextField.text;
    HGF = _LGFTextField.text;
    HGS = _HGSTextField.text;
    TF = _TF.text;
    scalled = [NSString stringWithFormat: @"%ld", (long)_ScalledSeg.selectedSegmentIndex];
    challanged = [NSString stringWithFormat:@"%ld", (long)_ChallangedSeg.selectedSegmentIndex];
    WZA = [NSString stringWithFormat:@"%ld", (long)_WZASeg.selectedSegmentIndex];
    PD = [NSString stringWithFormat:@"%ld", (long)_PDSwitch.on];
    Teleopcomments2 = _TeleopComments2TextBox.text;
    
    //Prepare for Write
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2_Teleop2");
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:LocalAdreessing ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    bool success;
    
    // Variable Write
    if ([contents rangeOfString:@"H1"].location == NSNotFound) {
        NSLog(@"string does not contain H1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H1"
                                                       withString:LGS];
    }
    if ([contents rangeOfString:@"H2"].location == NSNotFound) {
        NSLog(@"string does not contain H2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H2"
                                                       withString:LGF];
    }
    if ([contents rangeOfString:@"H3"].location == NSNotFound) {
        NSLog(@"string does not contain H3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H3"
                                                       withString:HGS];
    }
    if ([contents rangeOfString:@"H4"].location == NSNotFound) {
        NSLog(@"string does not contain H4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H4"
                                                       withString:HGF];
    }
    if ([contents rangeOfString:@"H5"].location == NSNotFound) {
        NSLog(@"string does not contain H5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H5"
                                                       withString:scalled];
    }
    if ([contents rangeOfString:@"H6"].location == NSNotFound) {
        NSLog(@"string does not contain H6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H6"
                                                       withString:challanged];
    }
    if ([contents rangeOfString:@"H7"].location == NSNotFound) {
        NSLog(@"string does not contain H7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H7"
                                                       withString:TF];
    }
    if ([contents rangeOfString:@"H8"].location == NSNotFound) {
        NSLog(@"string does not contain H8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H8"
                                                       withString:Teleopcomments2];
    }
    if ([contents rangeOfString:@"H9"].location == NSNotFound) {
        NSLog(@"string does not contain H9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H9"
                                                       withString:PD];
        success = YES;
    }
    NSString *alertString_F = @"teleop2 Data Insertion failed";
    NSString *alertString_S = @"teleop2 Data was Archived Succesfully, T";
    
    // Write Status
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopOneView"];
    
    success = YES;
    if (success == YES)
    {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Data Saved"
                                    message:@"Teleop Part 2 Report was successfully archived"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Go to Teleop part 1"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self dismissViewControllerAnimated:YES completion:nil];
                                 [self presentViewController:vc animated:YES completion:nil];
                                 [self TeleReload1];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Make Edits"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(IBAction) QuicksaveAuton {
    
    // Auton object check
    if (_PortStartedSwitch.isOn)
    {
        portStartValue = @"1";
    }
    else
    {
        portStartValue = @"0";
    }
    if (_PortReachedSwitch.isOn)
    {
        portReachValue = @"1";
    }
    else
    {
        portReachValue = @"0";
    }
    if (_PortCrossedSwitch.isOn)
    {
        portCrossValue = @"1";
    }
    else
    {
        portCrossValue = @"0";
    }
    if (_ChevalStartedSwitch.isOn)
    {
        chevalStartValue = @"1";
    }
    else
    {
        chevalStartValue = @"0";
    }
    if (_ChevalReachedSwitch.isOn)
    {
        chevalReachValue = @"1";
    }
    else
    {
        chevalReachValue = @"0";
    }
    if (_ChevalCrossedSwitch.isOn)
    {
        chevalCrossValue = @"1";
    }
    else
    {
        chevalCrossValue = @"0";
    }
    if (_MoatStartedSwitch.isOn)
    {
        moatStartValue = @"1";
    }
    else
    {
        moatStartValue = @"0";
    }
    if (_MoatReachedSwitch.isOn)
    {
        moatReachValue = @"1";
    }
    else
    {
        moatReachValue = @"0";
    }
    if (_MoatCrossedSwitch.isOn)
    {
        moatCrossValue = @"1";
    }
    else
    {
        moatCrossValue = @"0";
    }
    if (_RampartsStartedSwitch.isOn)
    {
        rampartsStartValue = @"1";
    }
    else
    {
        rampartsStartValue = @"0";
    }
    if ( _RampartsReachedSwitch.isOn)
    {
        rampartsReachValue = @"1";
    }
    else
    {
        rampartsReachValue = @"0";
    }
    if (_RampartsCrossedSwitch.isOn)
    {
        rampartsCrossValue = @"1";
    }
    else
    {
        rampartsCrossValue = @"0";
    }
    if (_DrawbridgeStartedSwitch.isOn)
    {
        drawbridgeStartValue = @"1";
    }
    else
    {
        drawbridgeStartValue = @"0";
    }
    if (_DrawbridgeReachedSwitch.isOn)
    {
        drawbridgeReachValue = @"1";
    }
    else
    {
        drawbridgeReachValue = @"0";
    }
    if (_DrawbridgeCrossedSwitch.isOn)
    {
        drawbridgeCrossValue = @"1";
    }
    else
    {
        drawbridgeCrossValue = @"0";
    }
    if (_SallyportStartedSwitch.isOn)
    {
        sallyportStartValue = @"1";
    }
    else
    {
        sallyportStartValue = @"0";
    }
    if (_SallyportReachedSwitch)
    {
        sallyportReachValue = @"1";
    }
    else
    {
        sallyportReachValue = @"0";
    }
    if (_SallyportCrossedSwitch.isOn)
    {
        sallyportCrossValue = @"1";
    }
    else
    {
        sallyportCrossValue = @"0";
    }
    if (_RockwallStartedSwitch.isOn)
    {
        rockwallStartValue = @"1";
    }
    else
    {
        rockwallStartValue = @"0";
    }
    if (_RockwallReachedSwitch.isOn)
    {
        rockwallReachValue = @"1";
    }
    else
    {
        rockwallReachValue = @"0";
    }
    if (_RockwallCrossedSwitch.isOn)
    {
        rockwallCrossValue = @"1";
    }
    else
    {
        rockwallCrossValue = @"0";
    }
    if ( _RoughTerrainStartedSwitch.isOn)
    {
        roughterrainStartValue = @"1";
    }
    else
    {
        roughterrainStartValue = @"0";
    }
    if (_RoughTerrainReachedSwitch.isOn)
    {
        roughterrainReachValue = @"1";
    }
    else
    {
        roughterrainReachValue = @"0";
    }
    if ( _RoughTerrainCrossedSwitch.isOn)
    {
        roughterrainCrossValue = @"1";
    }
    else
    {
        roughterrainCrossValue = @"0";
    }
    if (_LowbarStartedSwitch.isOn)
    {
        lowbarStartValue = @"1";
    }
    else
    {
        lowbarStartValue = @"0";
    }
    if (_LowbarReachedSwitch.isOn)
    {
        lowbarReachValue = @"1";
    }
    else
    {
        lowbarReachValue = @"0";
    }
    if (_LowbarCrossedSwitch.isOn)
    {
        lowbarCrossValue = @"1";
    }
    {
        lowbarCrossValue = @"0";
    }
    if (_spybotSeg.selectedSegmentIndex == 0)
    {
        spyValue = @"0";
    }
    else if
        (_spybotSeg.selectedSegmentIndex == 1)
    {
        spyValue = @"1";
    }
    else
    {
        spyValue = @"false";
    }
    if (_swbSeg.selectedSegmentIndex ==0) {
        swbValue = @"0";
    }
    else if (_swbSeg.selectedSegmentIndex ==1) {
        swbValue =@"1";
    }
    else
    {
        swbValue =@"false";
    }
    // End of Auton
    
    
    NSString *alertString_F = @"Auton Data Insertion failed";
    NSString *alertString_S = @"Auton Data was Archived Succesfully";
    
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:@"FRCRegional_X1_X2_Auton" ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    
    if (_TeamNumberTextView.text.length>0 &&_MatchNumberTextView.text.length>0)
    {
        // Portcullis Auton Section
        if ([contents rangeOfString:@"A1"].location == NSNotFound) {
            NSLog(@"string does not contain A1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A1"
                                                           withString:portStartValue];
        }
        if ([contents rangeOfString:@"A2"].location == NSNotFound) {
            NSLog(@"string does not contain A2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A2"
                                                           withString:portReachValue];
        }
        if ([contents rangeOfString:@"A3"].location == NSNotFound) {
            NSLog(@"string does not contain A3");
            
        }
        else {
            contents = [contents stringByReplacingOccurrencesOfString:@"A3"
                                                           withString:portCrossValue];
        }
        // cheval de frise Auton section
        if ([contents rangeOfString:@"A4"].location == NSNotFound) {
            NSLog(@"string does not contain A4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A4"
                                                           withString:chevalStartValue];
        }
        if ([contents rangeOfString:@"A5"].location == NSNotFound) {
            NSLog(@"string does not contain A5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A5"
                                                           withString:chevalReachValue];
        }
        if ([contents rangeOfString:@"A6"].location == NSNotFound) {
            NSLog(@"string does not contain A6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A6"
                                                           withString:chevalCrossValue];
        }
        // Moat Auton Section
        
        if ([contents rangeOfString:@"A7"].location == NSNotFound) {
            NSLog(@"string does not contain A7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A7"
                                                           withString:moatStartValue];
        }
        if ([contents rangeOfString:@"A8"].location == NSNotFound) {
            NSLog(@"string does not contain A8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A8"
                                                           withString:moatReachValue];
        }
        if ([contents rangeOfString:@"A9"].location == NSNotFound) {
            NSLog(@"string does not contain A9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"A9"
                                                           withString:moatCrossValue];
        }
        // Ramparts Auton Section
        if ([contents rangeOfString:@"B1"].location == NSNotFound) {
            NSLog(@"string does not contain B1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B1"
                                                           withString:rampartsStartValue];
        }
        if ([contents rangeOfString:@"B2"].location == NSNotFound) {
            NSLog(@"string does not contain B2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B2"
                                                           withString:rampartsReachValue];
        }
        if ([contents rangeOfString:@"B3"].location == NSNotFound) {
            NSLog(@"string does not contain B3");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B3"
                                                           withString:rampartsCrossValue];
        }
        // Drawbridge Auton Section
        if ([contents rangeOfString:@"B4"].location == NSNotFound) {
            NSLog(@"string does not contain B4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B4"
                                                           withString:drawbridgeStartValue];
        }
        if ([contents rangeOfString:@"B5"].location == NSNotFound) {
            NSLog(@"string does not contain B5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B5"
                                                           withString:drawbridgeReachValue];
        }
        if ([contents rangeOfString:@"B6"].location == NSNotFound) {
            NSLog(@"string does not contain B6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B6"
                                                           withString:drawbridgeCrossValue];
        }
        // Sally Port Auton Section
        if ([contents rangeOfString:@"B7"].location == NSNotFound) {
            NSLog(@"string does not contain B7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B7"
                                                           withString:sallyportStartValue];
        }
        if ([contents rangeOfString:@"B8"].location == NSNotFound) {
            NSLog(@"string does not contain B8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B8"
                                                           withString:sallyportReachValue];
        }
        if ([contents rangeOfString:@"B9"].location == NSNotFound) {
            NSLog(@"string does not contain B9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"B9"
                                                           withString:sallyportCrossValue];
        }
        // RockWall Auton Section
        if ([contents rangeOfString:@"C1"].location == NSNotFound) {
            NSLog(@"string does not contain C1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C1"
                                                           withString:rockwallStartValue];
        }
        if ([contents rangeOfString:@"C2"].location == NSNotFound) {
            NSLog(@"string does not contain C2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C2"
                                                           withString:rockwallReachValue];
        }
        if ([contents rangeOfString:@"C3"].location == NSNotFound) {
            NSLog(@"string does not contain C3");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C3"
                                                           withString:rockwallCrossValue];
        }
        // Rough Terrain Auton Section
        if ([contents rangeOfString:@"C4"].location == NSNotFound) {
            NSLog(@"string does not contain C4");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C4"
                                                           withString:roughterrainStartValue];
        }
        if ([contents rangeOfString:@"C5"].location == NSNotFound) {
            NSLog(@"string does not contain C5");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C5"
                                                           withString:roughterrainReachValue];
        }
        if ([contents rangeOfString:@"C6"].location == NSNotFound) {
            NSLog(@"string does not contain C6");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C6"
                                                           withString:roughterrainCrossValue];
        }
        // Lowbar Auton Section
        if ([contents rangeOfString:@"C7"].location == NSNotFound) {
            NSLog(@"string does not contain C7");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C7"
                                                           withString:lowbarStartValue];
        }
        if ([contents rangeOfString:@"C8"].location == NSNotFound) {
            NSLog(@"string does not contain C8");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C8"
                                                           withString:lowbarReachValue];
        }
        if ([contents rangeOfString:@"C9"].location == NSNotFound) {
            NSLog(@"string does not contain C9");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"C9"
                                                           withString:lowbarCrossValue];
        }
        // Spybot Value Section
        if ([contents rangeOfString:@"D1"].location == NSNotFound) {
            NSLog(@"string does not contain D1");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"D1"
                                                           withString:spyValue];
        }
        // Started With Ball value section
        if ([contents rangeOfString:@"D2"].location == NSNotFound) {
            NSLog(@"string does not contain D2");
        }
        else
        {
            contents = [contents stringByReplacingOccurrencesOfString:@"D2"
                                                           withString:swbValue];
        }
        NSLog(@"Failed to write");
        
    }
    
    autonComments = _autonCommentsTextView.text;
    contents = [contents stringByReplacingOccurrencesOfString:@"D3"
                                                   withString:autonComments];
    autonShotValue = [NSString stringWithFormat:@"%ld", (long) _AutoShot.selectedSegmentIndex];
    contents = [contents stringByReplacingOccurrencesOfString:@"D4" withString:autonShotValue];
    
    
    matchnumber = _MatchNumberTextView.text;
    teamnumber = _TeamNumberTextView.text;
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    appDelegate.Xmatchnumber = _MatchNumberTextView.text;     //..to write matchnumber
    appDelegate.Xteamnumber = _TeamNumberTextView.text;       //..to write teamnumber
    
    contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                   withString:matchnumber];
    contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSLog(contents);
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2_Auton.dbs");
    
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSError *error;
    NSString *stringToWrite = contents;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdreessing];
    [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(contents);
    NSLog(filePath);
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopOneView"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
    [self TeleReload1 ];
 
}

-(IBAction) QuicksaveTeleop1toAuton {
    
    portScoreValue = _Tele_PortcullisValueTextField.text;
    chevalScoreValue = _Tele_ChevalDeFriseValueTextField.text;
    moatScoreValue = _Tele_MoatValueTextField.text;
    rampartsScoreValue = _Tele_RampartsValueTextField.text;
    drawbridgeScoreValue = _Tele_RampartsValueTextField.text;
    sallyportScoreValue = _Tele_SallyPortValueTextField.text;
    rockwallScoreValue = _Tele_RockWallValueTextField.text;
    roughScoreValue = _Tele_RoughTerrainValueTextField.text;
    lowbarScoreValue = _Tele_LowBarValueTextField.text;
    
    //Setup Segment values
    portAbilityValue = [NSString stringWithFormat: @"%ld", (long) _Tele_PortcullisAbilitySeg.selectedSegmentIndex];
    chevalAbilityValue = [NSString stringWithFormat: @"%ld" ,(long) _Tele_ChevalDeFriseAbilitySeg.selectedSegmentIndex];
    moatAbilityValue = [NSString stringWithFormat : @"%ld",(long) _Tele_MoatAbilitySeg.selectedSegmentIndex];
    rampartsAbilityValue = [NSString stringWithFormat: @"%ld", (long)_Tele_RampartsAbilitySeg.selectedSegmentIndex];
    drawbridgeAbilityValue = [NSString stringWithFormat:@"%ld" , (long)_Tele_DrawbridgeAbilitySeg.selectedSegmentIndex];
    sallyportAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_SallyPortAbilitySeg.selectedSegmentIndex];
    rockwallAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RockWallAbilitySeg.selectedSegmentIndex];
    roughAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RoughTerranAbilitySeg.selectedSegmentIndex];
    lowbarAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_LowBarAbilitySeg.selectedSegmentIndex];
    
    //Setup Teleop HAPC object check
    HAPC_Port = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_PortSwitch.on];
    HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
    HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
    HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
    HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
    HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
    HAPC_Rock = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RockSwitch.on];
    HAPC_Rough = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RoughSwitch.on];
    HAPC_LowBar = [NSString stringWithFormat:@"%ld" , (long)_HAPC_Tele_LowBarSwitch.on];
    
    //Setup Teleop HTC object check
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_MoatSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_RampSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    // End o Teleop object check
    
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2");
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:@"FRCRegional_X1_X2_Teleop1" ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    
    // Logical Processing
    if ([contents rangeOfString:@"E1"].location == NSNotFound) {
        NSLog(@"string does not contain E1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E1"
                                                       withString:portScoreValue];
    }
    if ([contents rangeOfString:@"J1"].location == NSNotFound) {
        NSLog(@"string does not contain J1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J1"
                                                       withString:portAbilityValue];
    }
    if ([contents rangeOfString:@"E2"].location == NSNotFound) {
        NSLog(@"string does not contain E2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E2.1" withString:chevalScoreValue];
    }
    if ([contents rangeOfString:@"J2"].location == NSNotFound) {
        NSLog(@"string does not contain J2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J2" withString:chevalAbilityValue];
    }
    if ([contents rangeOfString:@"E3"].location ==NSNotFound) {
        NSLog(@"string does not contain E3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E3" withString:moatScoreValue];
    }
    if ([contents rangeOfString:@"J3"].location ==NSNotFound) {
        NSLog(@"string does not contain J3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J3" withString:moatAbilityValue];
    }
    if ([contents rangeOfString:@"E4"].location ==NSNotFound) {
        NSLog(@"string does not contain E4");
    }
    else
    {
        contents= [contents stringByReplacingOccurrencesOfString:@"E4" withString:rampartsScoreValue];
    }
    if ([contents rangeOfString:@"J4"].location ==NSNotFound) {
        NSLog(@"string does not contain J4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J4" withString:rampartsAbilityValue];
    }
    if ([contents rangeOfString:@"E5"].location ==NSNotFound) {
        NSLog(@"string does not contain E5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E5" withString:drawbridgeScoreValue];
    }
    if ([contents rangeOfString:@"J5"].location ==NSNotFound) {
        NSLog(@"string does not contain J5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J5" withString:drawbridgeAbilityValue];
    }
    if ([contents rangeOfString:@"E6"].location == NSNotFound) {
        NSLog(@"string does not contain E6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E6" withString:sallyportScoreValue];
    }
    if ([contents rangeOfString:@"J6"].location ==NSNotFound) {
        NSLog(@"string does not contain J6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J6" withString:sallyportAbilityValue];
    }
    if ([contents rangeOfString:@"E7"].location ==NSNotFound) {
        NSLog(@"string does not contain E7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E7" withString:rockwallScoreValue];
    }
    if ([contents rangeOfString:@"J7"].location ==NSNotFound) {
        NSLog(@"string does not contain J7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J7" withString:rockwallAbilityValue];
    }
    if ([contents rangeOfString:@"E8"].location ==NSNotFound) {
        NSLog(@"string does not contain E8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E8" withString:roughScoreValue];
    }
    if ([contents rangeOfString:@"J8"].location ==NSNotFound) {
        NSLog(@"string does not contain j8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J8" withString:roughAbilityValue];
    }
    if ([contents rangeOfString:@"E9"].location ==NSNotFound) {
        NSLog(@"string does not contain E9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E9" withString:lowbarScoreValue];
    }
    if ([contents rangeOfString:@"J9"].location ==NSNotFound) {
        NSLog(@"string does not contain J9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J9" withString:lowbarAbilityValue];
    }
    if ([contents rangeOfString:@"P1"].location ==NSNotFound) {
        NSLog(@"string does not contain P1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"P1" withString:@"FieldComments"]; // CHANGE THIS !!!
    }
    
    
    
    // HAPC variable addresing
    /*
     
     This section was removed for continuity reasons
     
     HAPC_Port = [NSString stringWithFormat: @"%ld", (long)_HAPC_Tele_PortSwitch.on];
     HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
     HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
     HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
     HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
     HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
     HAPC_Rock = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RockSwitch.on];
     HAPC_Rough = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RoughSwitch.on];
     HAPC_LowBar = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_LowBarSwitch.on];
     */
    
    //HTC variable addressing
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_ChevSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RampSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_MoatSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    
    
    // HAPC and HTC Logical processing
    NSString *alertString_F = @"teleop Data Insertion failed";
    NSString *alertString_S = @"teleop Data was Archived Succesfully";
    bool success;
    success = YES;
    
    
    if ([contents rangeOfString:@"F1"].location == NSNotFound) {
        NSLog(@"string does not contain F1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F1"
                                                       withString:HAPC_Port];
    }
    if ([contents rangeOfString:@"F2"].location == NSNotFound) {
        NSLog(@"string does not contain F2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F2"
                                                       withString:HAPC_Chev];
    }
    if ([contents rangeOfString:@"F3"].location == NSNotFound) {
        NSLog(@"string does not contain F3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F3"
                                                       withString:HAPC_Moat];
    }
    if ([contents rangeOfString:@"F4"].location == NSNotFound) {
        NSLog(@"string does not contain F4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F4"
                                                       withString:HAPC_Ramp];
    }
    if ([contents rangeOfString:@"F5"].location == NSNotFound) {
        NSLog(@"string does not contain F5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F5"
                                                       withString:HAPC_Draw];
    }
    if ([contents rangeOfString:@"F6"].location == NSNotFound) {
        NSLog(@"string does not contain F6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F6"
                                                       withString:HAPC_Sally];
    }
    if ([contents rangeOfString:@"F7"].location == NSNotFound) {
        NSLog(@"string does not contain F7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F7"
                                                       withString:HAPC_Rock];
    }
    if ([contents rangeOfString:@"F8"].location == NSNotFound) {
        NSLog(@"string does not contain F8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F8"
                                                       withString:HAPC_Rough];
    }
    if ([contents rangeOfString:@"F9"].location == NSNotFound) {
        NSLog(@"string does not contain F9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F9"
                                                       withString:HAPC_LowBar];
    }
    if ([contents rangeOfString:@"G1"].location == NSNotFound) {
        NSLog(@"string does not contain G1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G1"
                                                       withString:HTC_Port];
        
    }
    if ([contents rangeOfString:@"G2"].location == NSNotFound) {
        NSLog(@"string does not contain G2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G2"
                                                       withString:HTC_Chev];
    }
    if ([contents rangeOfString:@"G3"].location == NSNotFound) {
        NSLog(@"string does not contain G3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G3"
                                                       withString:HTC_Moat];
    }
    if ([contents rangeOfString:@"G4"].location == NSNotFound) {
        NSLog(@"string does not contain G4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G4"
                                                       withString:HTC_Ramp];
    }
    if ([contents rangeOfString:@"G5"].location == NSNotFound) {
        NSLog(@"string does not contain G5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G5"
                                                       withString:HTC_Draw];
    }
    if ([contents rangeOfString:@"G6"].location == NSNotFound) {
        NSLog(@"string does not contain G6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G6"
                                                       withString:HTC_Sally];
    }
    if ([contents rangeOfString:@"G7"].location == NSNotFound) {
        NSLog(@"string does not contain G7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G7"
                                                       withString:HTC_Rock];
    }
    if ([contents rangeOfString:@"G8"].location == NSNotFound) {
        NSLog(@"string does not contain G8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G8"
                                                       withString:HTC_Rough];
    }
    if ([contents rangeOfString:@"G9"].location == NSNotFound) {
        NSLog(@"string does not contain G9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G9"
                                                       withString:HTC_Low];
        
    }
  
        teleopcomments = _TeleopCommentsTextBox.text;
        
        
        
        NSLog(@"Write Cycle 2");
        NSError *error;
        
        NSString *LocalAdressing = @"FRCRegional_X1_X2_Teleop1.dbs";
        LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
        LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
        
        contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                       withString:matchnumber];
        contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
        
        NSString *stringToWrite = contents;
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdressing];
        
        [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"AutonView"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
    [self AutonReload ];
    
}

-(IBAction) QuicksaveTeleop1toTele2 {
    
    portScoreValue = _Tele_PortcullisValueTextField.text;
    chevalScoreValue = _Tele_ChevalDeFriseValueTextField.text;
    moatScoreValue = _Tele_MoatValueTextField.text;
    rampartsScoreValue = _Tele_RampartsValueTextField.text;
    drawbridgeScoreValue = _Tele_RampartsValueTextField.text;
    sallyportScoreValue = _Tele_SallyPortValueTextField.text;
    rockwallScoreValue = _Tele_RockWallValueTextField.text;
    roughScoreValue = _Tele_RoughTerrainValueTextField.text;
    lowbarScoreValue = _Tele_LowBarValueTextField.text;
    
    //Setup Segment values
    portAbilityValue = [NSString stringWithFormat: @"%ld", (long) _Tele_PortcullisAbilitySeg.selectedSegmentIndex];
    chevalAbilityValue = [NSString stringWithFormat: @"%ld" ,(long) _Tele_ChevalDeFriseAbilitySeg.selectedSegmentIndex];
    moatAbilityValue = [NSString stringWithFormat : @"%ld",(long) _Tele_MoatAbilitySeg.selectedSegmentIndex];
    rampartsAbilityValue = [NSString stringWithFormat: @"%ld", (long)_Tele_RampartsAbilitySeg.selectedSegmentIndex];
    drawbridgeAbilityValue = [NSString stringWithFormat:@"%ld" , (long)_Tele_DrawbridgeAbilitySeg.selectedSegmentIndex];
    sallyportAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_SallyPortAbilitySeg.selectedSegmentIndex];
    rockwallAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RockWallAbilitySeg.selectedSegmentIndex];
    roughAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_RoughTerranAbilitySeg.selectedSegmentIndex];
    lowbarAbilityValue = [NSString stringWithFormat:@"%ld", (long) _Tele_LowBarAbilitySeg.selectedSegmentIndex];
    
    //Setup Teleop HAPC object check
    HAPC_Port = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_PortSwitch.on];
    HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
    HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
    HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
    HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
    HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
    HAPC_Rock = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RockSwitch.on];
    HAPC_Rough = [NSString stringWithFormat:@"%ld" , (long) _HAPC_Tele_RoughSwitch.on];
    HAPC_LowBar = [NSString stringWithFormat:@"%ld" , (long)_HAPC_Tele_LowBarSwitch.on];
    
    //Setup Teleop HTC object check
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_MoatSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_RampSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld" , (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    // End o Teleop object check
    
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2");
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdreessing = [LocalAdreessing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:@"FRCRegional_X1_X2_Teleop1" ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    
    // Logical Processing
    if ([contents rangeOfString:@"E1"].location == NSNotFound) {
        NSLog(@"string does not contain E1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E1"
                                                       withString:portScoreValue];
    }
    if ([contents rangeOfString:@"J1"].location == NSNotFound) {
        NSLog(@"string does not contain J1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J1"
                                                       withString:portAbilityValue];
    }
    if ([contents rangeOfString:@"E2"].location == NSNotFound) {
        NSLog(@"string does not contain E2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E2.1" withString:chevalScoreValue];
    }
    if ([contents rangeOfString:@"J2"].location == NSNotFound) {
        NSLog(@"string does not contain J2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J2" withString:chevalAbilityValue];
    }
    if ([contents rangeOfString:@"E3"].location ==NSNotFound) {
        NSLog(@"string does not contain E3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E3" withString:moatScoreValue];
    }
    if ([contents rangeOfString:@"J3"].location ==NSNotFound) {
        NSLog(@"string does not contain J3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J3" withString:moatAbilityValue];
    }
    if ([contents rangeOfString:@"E4"].location ==NSNotFound) {
        NSLog(@"string does not contain E4");
    }
    else
    {
        contents= [contents stringByReplacingOccurrencesOfString:@"E4" withString:rampartsScoreValue];
    }
    if ([contents rangeOfString:@"J4"].location ==NSNotFound) {
        NSLog(@"string does not contain J4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J4" withString:rampartsAbilityValue];
    }
    if ([contents rangeOfString:@"E5"].location ==NSNotFound) {
        NSLog(@"string does not contain E5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E5" withString:drawbridgeScoreValue];
    }
    if ([contents rangeOfString:@"J5"].location ==NSNotFound) {
        NSLog(@"string does not contain J5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J5" withString:drawbridgeAbilityValue];
    }
    if ([contents rangeOfString:@"E6"].location == NSNotFound) {
        NSLog(@"string does not contain E6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E6" withString:sallyportScoreValue];
    }
    if ([contents rangeOfString:@"J6"].location ==NSNotFound) {
        NSLog(@"string does not contain J6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J6" withString:sallyportAbilityValue];
    }
    if ([contents rangeOfString:@"E7"].location ==NSNotFound) {
        NSLog(@"string does not contain E7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E7" withString:rockwallScoreValue];
    }
    if ([contents rangeOfString:@"J7"].location ==NSNotFound) {
        NSLog(@"string does not contain J7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J7" withString:rockwallAbilityValue];
    }
    if ([contents rangeOfString:@"E8"].location ==NSNotFound) {
        NSLog(@"string does not contain E8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E8" withString:roughScoreValue];
    }
    if ([contents rangeOfString:@"J8"].location ==NSNotFound) {
        NSLog(@"string does not contain j8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J8" withString:roughAbilityValue];
    }
    if ([contents rangeOfString:@"E9"].location ==NSNotFound) {
        NSLog(@"string does not contain E9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"E9" withString:lowbarScoreValue];
    }
    if ([contents rangeOfString:@"J9"].location ==NSNotFound) {
        NSLog(@"string does not contain J9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"J9" withString:lowbarAbilityValue];
    }
    if ([contents rangeOfString:@"P1"].location ==NSNotFound) {
        NSLog(@"string does not contain P1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"P1" withString:_TeleopCommentsTextBox.text];
    }
    
    
    
    // HAPC variable addresing
    /*
     
     This section was removed for continuity reasons
     
     HAPC_Port = [NSString stringWithFormat: @"%ld", (long)_HAPC_Tele_PortSwitch.on];
     HAPC_Chev = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_ChevSwitch.on];
     HAPC_Moat = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_MoatSwitch.on];
     HAPC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RampSwitch.on];
     HAPC_Draw = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_DrawSwitch.on];
     HAPC_Sally = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_SallySwitch.on];
     HAPC_Rock = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RockSwitch.on];
     HAPC_Rough = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_RoughSwitch.on];
     HAPC_LowBar = [NSString stringWithFormat:@"%ld", (long)_HAPC_Tele_LowBarSwitch.on];
     */
    
    //HTC variable addressing
    HTC_Port = [NSString stringWithFormat:@"%ld", (long)_HTC_ele_PortSwitch.on];
    HTC_Chev = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_ChevSwitch.on];
    HTC_Ramp = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RampSwitch.on];
    HTC_Moat = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_MoatSwitch.on];
    HTC_Draw = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_DrawSwitch.on];
    HTC_Sally = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_SallySwitch.on];
    HTC_Rock = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RockSwitch.on];
    HTC_Rough = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_RoughSwitch.on];
    HTC_Low = [NSString stringWithFormat:@"%ld", (long)_HTC_Tele_LowBarSwitch.on];
    
    
    // HAPC and HTC Logical processing
    NSString *alertString_F = @"teleop Data Insertion failed";
    NSString *alertString_S = @"teleop Data was Archived Succesfully";
    bool success;
    success = YES;
    
    
    if ([contents rangeOfString:@"F1"].location == NSNotFound) {
        NSLog(@"string does not contain F1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F1"
                                                       withString:HAPC_Port];
    }
    if ([contents rangeOfString:@"F2"].location == NSNotFound) {
        NSLog(@"string does not contain F2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F2"
                                                       withString:HAPC_Chev];
    }
    if ([contents rangeOfString:@"F3"].location == NSNotFound) {
        NSLog(@"string does not contain F3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F3"
                                                       withString:HAPC_Moat];
    }
    if ([contents rangeOfString:@"F4"].location == NSNotFound) {
        NSLog(@"string does not contain F4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F4"
                                                       withString:HAPC_Ramp];
    }
    if ([contents rangeOfString:@"F5"].location == NSNotFound) {
        NSLog(@"string does not contain F5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F5"
                                                       withString:HAPC_Draw];
    }
    if ([contents rangeOfString:@"F6"].location == NSNotFound) {
        NSLog(@"string does not contain F6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F6"
                                                       withString:HAPC_Sally];
    }
    if ([contents rangeOfString:@"F7"].location == NSNotFound) {
        NSLog(@"string does not contain F7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F7"
                                                       withString:HAPC_Rock];
    }
    if ([contents rangeOfString:@"F8"].location == NSNotFound) {
        NSLog(@"string does not contain F8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F8"
                                                       withString:HAPC_Rough];
    }
    if ([contents rangeOfString:@"F9"].location == NSNotFound) {
        NSLog(@"string does not contain F9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"F9"
                                                       withString:HAPC_LowBar];
    }
    if ([contents rangeOfString:@"G1"].location == NSNotFound) {
        NSLog(@"string does not contain G1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G1"
                                                       withString:HTC_Port];
        
    }
    if ([contents rangeOfString:@"G2"].location == NSNotFound) {
        NSLog(@"string does not contain G2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G2"
                                                       withString:HTC_Chev];
    }
    if ([contents rangeOfString:@"G3"].location == NSNotFound) {
        NSLog(@"string does not contain G3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G3"
                                                       withString:HTC_Moat];
    }
    if ([contents rangeOfString:@"G4"].location == NSNotFound) {
        NSLog(@"string does not contain G4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G4"
                                                       withString:HTC_Ramp];
    }
    if ([contents rangeOfString:@"G5"].location == NSNotFound) {
        NSLog(@"string does not contain G5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G5"
                                                       withString:HTC_Draw];
    }
    if ([contents rangeOfString:@"G6"].location == NSNotFound) {
        NSLog(@"string does not contain G6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G6"
                                                       withString:HTC_Sally];
    }
    if ([contents rangeOfString:@"G7"].location == NSNotFound) {
        NSLog(@"string does not contain G7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G7"
                                                       withString:HTC_Rock];
    }
    if ([contents rangeOfString:@"G8"].location == NSNotFound) {
        NSLog(@"string does not contain G8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G8"
                                                       withString:HTC_Rough];
    }
    if ([contents rangeOfString:@"G9"].location == NSNotFound) {
        NSLog(@"string does not contain G9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"G9"
                                                       withString:HTC_Low];
        
    }
   
        teleopcomments = _TeleopCommentsTextBox.text;
        
        
        
        NSLog(@"Write Cycle 2");
        NSError *error;
        
        NSString *LocalAdressing = @"FRCRegional_X1_X2_Teleop1.dbs";
        LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
        LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
        
        contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                       withString:matchnumber];
        contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
        
        NSString *stringToWrite = contents;
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdressing];
        
        [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];

    
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopTwoView"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
    [self TeleReload2 ];

                                 
    
}

-(IBAction) QuicksaveTeleop2 {
    // Assign Values
    LGS = _LGSTextField.text;
    LGF = _LGFTextField.text;
    HGF = _LGFTextField.text;
    HGS = _HGSTextField.text;
    TF = _TF.text;
    scalled = [NSString stringWithFormat: @"%ld", (long)_ScalledSeg.selectedSegmentIndex];
    challanged = [NSString stringWithFormat:@"%ld", (long)_ChallangedSeg.selectedSegmentIndex];
    WZA = [NSString stringWithFormat:@"%ld", (long)_WZASeg.selectedSegmentIndex];
    PD = [NSString stringWithFormat:@"%ld", (long)_PDSwitch.on];
    Teleopcomments2 = _TeleopComments2TextBox.text;
    
    //Prepare for Write
    // Variable Overwrite Proccess
    NSString *LocalAdreessing = (@"FRCRegional_X1_X2_Teleop2");
    
    NSString *dataFile = [[NSBundle mainBundle] pathForResource:LocalAdreessing ofType:@"dbs"];
    NSString *contents = [NSString stringWithContentsOfFile:dataFile encoding:NSUTF8StringEncoding error:nil];
    bool success;
    
    // Variable Write
    if ([contents rangeOfString:@"H1"].location == NSNotFound) {
        NSLog(@"string does not contain H1");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H1"
                                                       withString:LGS];
    }
    if ([contents rangeOfString:@"H2"].location == NSNotFound) {
        NSLog(@"string does not contain H2");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H2"
                                                       withString:LGF];
    }
    if ([contents rangeOfString:@"H3"].location == NSNotFound) {
        NSLog(@"string does not contain H3");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H3"
                                                       withString:HGS];
    }
    if ([contents rangeOfString:@"H4"].location == NSNotFound) {
        NSLog(@"string does not contain H4");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H4"
                                                       withString:HGF];
    }
    if ([contents rangeOfString:@"H5"].location == NSNotFound) {
        NSLog(@"string does not contain H5");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H5"
                                                       withString:scalled];
    }
    if ([contents rangeOfString:@"H6"].location == NSNotFound) {
        NSLog(@"string does not contain H6");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H6"
                                                       withString:challanged];
    }
    if ([contents rangeOfString:@"H7"].location == NSNotFound) {
        NSLog(@"string does not contain H7");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H7"
                                                       withString:TF];
    }
    if ([contents rangeOfString:@"H8"].location == NSNotFound) {
        NSLog(@"string does not contain H8");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H8"
                                                       withString:Teleopcomments2];
    }
    if ([contents rangeOfString:@"H9"].location == NSNotFound) {
        NSLog(@"string does not contain H9");
    }
    else
    {
        contents = [contents stringByReplacingOccurrencesOfString:@"H9"
                                                       withString:PD];
        success = YES;
    }
    NSString *alertString_F = @"teleop2 Data Insertion failed";
    NSString *alertString_S = @"teleop2 Data was Archived Succesfully, T";
    
    teleopcomments = _TeleopCommentsTextBox.text;
    
    
    
    NSLog(@"Write Cycle 2");
    NSError *error;
    
    NSString *LocalAdressing = @"FRCRegional_X1_X2_Teleop1.dbs";
    LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X1" withString:matchnumber];
    LocalAdressing = [ LocalAdressing stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    contents = [contents stringByReplacingOccurrencesOfString:@"X1"
                                                   withString:matchnumber];
    contents = [contents stringByReplacingOccurrencesOfString:@"X2" withString:teamnumber];
    
    NSString *stringToWrite = contents;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:LocalAdressing];
    
    [stringToWrite writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];

    
    // Write Status
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TeleopOneView"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
    [self TeleReload1 ];
}

// Reload Code Section

- (void)AutonReload {
    
    _MatchNumberTextView.text = matchnumber;
    _TeamNumberTextView.text = teamnumber;
    
    
    if ([portStartValue  isEqualToString: @"1"])
    {
        _PortStartedSwitch.on = YES;
    }
    else
    {
        _PortStartedSwitch.on = NO;
    }
    if ([portReachValue isEqualToString:@"1"])
    {
        _PortReachedSwitch.on = YES;
    }
    else
    {
        _PortReachedSwitch.on = NO;
    }
    if ([portCrossValue isEqualToString:@"1"])
    {
        _PortCrossedSwitch.on = YES;
    }
    else
    {
        _PortCrossedSwitch.on = NO;
    }
    if ([chevalStartValue isEqualToString:@"1"])
    {
        _ChevalStartedSwitch.on = YES;
    }
    else
    {
        _ChevalStartedSwitch.on = NO;
    }
    if ([chevalReachValue isEqualToString:@"1"])
    {
        _ChevalReachedSwitch.on = YES;
    }
    else
    {
        _ChevalReachedSwitch.on = NO;
    }
    if ([chevalCrossValue isEqualToString:@"1"])
    {
        _ChevalCrossedSwitch.on = YES;
    }
    else
    {
        _ChevalCrossedSwitch.on = NO;
    }
    if ([moatStartValue isEqualToString:@"1"])
    {
        _MoatStartedSwitch.on = YES;
    }
    else
    {
        _MoatStartedSwitch.on = NO;
    }
    if ([moatReachValue isEqualToString:@"1"])
    {
        _MoatReachedSwitch.on = YES;
    }
    else
    {
        _MoatReachedSwitch.on = NO;
    }
    if ([moatCrossValue isEqualToString:@"1"])
    {
        _MoatCrossedSwitch.on = YES;
    }
    else
    {
        _MoatCrossedSwitch.on = NO;
    }
    if ([rampartsStartValue isEqualToString:@"1"])
    {
        _RampartsStartedSwitch.on = YES;
    }
    else
    {
        _RampartsStartedSwitch.on = NO;
    }
    if ([rampartsReachValue isEqualToString:@"1"])
    {
        _RampartsReachedSwitch.on = YES;
    }
    else
    {
        _RampartsReachedSwitch.on = NO;
    }
    if ([rampartsCrossValue isEqualToString:@"1"])
    {
        _RampartsCrossedSwitch.on = YES;
    }
    else
    {
        _RampartsCrossedSwitch.on = NO;
    }
    if ([drawbridgeStartValue isEqualToString:@"1"])
    {
        _DrawbridgeStartedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeStartedSwitch.on = NO;
    }
    if ([drawbridgeReachValue isEqualToString:@"1"])
    {
        _DrawbridgeReachedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeReachedSwitch.on = NO;
    }
    if ([drawbridgeCrossValue isEqualToString:@"1"])
    {
        _DrawbridgeCrossedSwitch.on = YES;
    }
    else
    {
        _DrawbridgeCrossedSwitch.on = NO;
    }
    if ([sallyportStartValue isEqualToString:@"1"])
    {
        _SallyportStartedSwitch.on = YES;
    }
    else
    {
        _SallyportStartedSwitch.on = NO;
    }
    if ([sallyportReachValue isEqualToString:@"1"])
    {
        _SallyportReachedSwitch.on = YES;
    }
    else
    {
        _SallyportReachedSwitch.on = NO;
    }
    if ([sallyportCrossValue isEqualToString:@"1"])
    {
        _SallyportCrossedSwitch.on = YES;
    }
    else
    {
        _SallyportCrossedSwitch.on = NO;
    }
    if ([rockwallStartValue isEqualToString:@"1"])
    {
        _RockwallStartedSwitch.on = YES;
    }
    else
    {
        _RockwallStartedSwitch.on = NO;
    }
    if ([rockwallReachValue isEqualToString:@"1"])
    {
        _RockwallReachedSwitch.on = YES;
    }
    else
    {
        _RockwallReachedSwitch.on = NO;
    }
    if ([rockwallCrossValue isEqualToString:@"1"])
    {
        _RockwallCrossedSwitch.on = YES;
    }
    else
    {
        _RockwallCrossedSwitch.on = NO;
    }
    if ([roughterrainStartValue isEqualToString:@"1"])
    {
        _RoughTerrainStartedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainStartedSwitch.on = NO;
    }
    if ([roughterrainReachValue isEqualToString:@"1"])
    {
        _RoughTerrainReachedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainReachedSwitch.on = NO;
    }
    if ([roughterrainCrossValue isEqualToString:@"1"])
    {
        _RoughTerrainCrossedSwitch.on = YES;
    }
    else
    {
        _RoughTerrainCrossedSwitch.on = NO;
    }
    if ([lowbarStartValue isEqualToString:@"1"])
    {
        _LowbarStartedSwitch.on = YES;
    }
    else
    {
        _LowbarStartedSwitch.on = NO;
    }
    if ([lowbarReachValue isEqualToString:@"1"])
    {
        _LowbarReachedSwitch.on = YES;
    }
    else
    {
        _LowbarReachedSwitch.on = NO;
    }
    if ([lowbarCrossValue isEqualToString:@"1"])
    {
        _LowbarCrossedSwitch.on = YES;
    }
    else
    {
        _LowbarCrossedSwitch.on = NO;
    }
    
    _spybotSeg.selectedSegmentIndex = [ spyValue integerValue];
    _swbSeg.selectedSegmentIndex = [ swbValue integerValue];
    _autonCommentsTextView.text = autonComments;
    _AutoShot.selectedSegmentIndex = [autonShotValue integerValue];
    
}

- (void)TeleReload1 {
    
    _Tele_PortcullisValueTextField.text = portScoreValue;
    _Tele_ChevalDeFriseValueTextField.text = chevalScoreValue;
    _Tele_MoatValueTextField.text = moatScoreValue;
    _Tele_RampartsValueTextField.text = rampartsScoreValue;
    _Tele_DrawbridgeValueTextField.text = drawbridgeScoreValue;
    _Tele_SallyPortValueTextField.text = sallyportScoreValue;
    _Tele_RockWallValueTextField.text = rockwallScoreValue;
    _Tele_RoughTerrainValueTextField.text = roughScoreValue;
    _Tele_LowBarValueTextField.text = lowbarScoreValue;
    
    _Tele_PortcullisAbilitySeg.selectedSegmentIndex = [portAbilityValue integerValue];
    _Tele_ChevalDeFriseAbilitySeg.selectedSegmentIndex = [chevalAbilityValue integerValue];
    _Tele_MoatAbilitySeg.selectedSegmentIndex = [moatAbilityValue integerValue];
    _Tele_RampartsAbilitySeg.selectedSegmentIndex = [rampartsAbilityValue integerValue];
    _Tele_DrawbridgeAbilitySeg.selectedSegmentIndex = [drawbridgeAbilityValue integerValue];
    _Tele_SallyPortAbilitySeg.selectedSegmentIndex = [sallyportAbilityValue integerValue];
    _Tele_RockWallAbilitySeg.selectedSegmentIndex = [rockwallAbilityValue integerValue];
    _Tele_RoughTerranAbilitySeg.selectedSegmentIndex = [roughAbilityValue integerValue];
    _Tele_LowBarAbilitySeg.selectedSegmentIndex = [lowbarAbilityValue integerValue];
    
    if ([HTC_Port isEqualToString:@"1"]) {
        _HTC_ele_PortSwitch.on = YES;
    }
    else
    {
        _HTC_ele_PortSwitch.on = NO;
    }
    if([HTC_Chev isEqualToString:@"1"]) {
        _HTC_Tele_ChevSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_ChevSwitch.on = NO;
    }
    if([HTC_Moat isEqualToString:@"1"]) {
        _HTC_Tele_MoatSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_MoatSwitch.on = NO;
    }
    if([HTC_Ramp isEqualToString:@"1"]) {
        _HTC_Tele_RampSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RampSwitch.on = NO;
    }
    if([HTC_Draw isEqualToString:@"1"]) {
        _HTC_Tele_DrawSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_DrawSwitch.on = NO;
    }
    if([HTC_Sally isEqualToString:@"1"]) {
        _HTC_Tele_SallySwitch.on = YES;
    }
    else
    {
        _HTC_Tele_SallySwitch.on = NO;
    }
    if([HTC_Rock isEqualToString:@"1"]) {
        _HTC_Tele_RockSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RockSwitch.on = NO;
    }
    if([HTC_Rough isEqualToString:@"1"]) {
        _HTC_Tele_RoughSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_RoughSwitch.on = NO;
    }
    if([HTC_Low isEqualToString:@"1"]) {
        _HTC_Tele_LowBarSwitch.on = YES;
    }
    else
    {
        _HTC_Tele_LowBarSwitch.on = NO;
    }
    _TeleopCommentsTextBox.text = teleopcomments;
}

-(void) TeleReload2 {
 
    _LGSTextField.text = LGS;
    _LGFTextField.text = LGF;
    _HGSTextField.text = HGS;
    _HGFTextField.text = HGF;
    _TF.text = TF;
    
    _ScalledSeg.selectedSegmentIndex = [scalled integerValue];
    _ChallangedSeg.selectedSegmentIndex = [challanged integerValue];
    _WZASeg.selectedSegmentIndex = [WZA integerValue];
    _TeleopCommentsTextBox.text = Teleopcomments2;
    
    if ([PD isEqualToString:@"1"]) {
        _PDSwitch.on = YES;
    }
    else
    {
        _PDSwitch.on = NO;
    }
    
    _TeleopComments2TextBox.text = Teleopcomments2;
}



- (IBAction)PortStepPressed:(id)sender {
    self.Tele_PortcullisValueTextField.text =[NSString stringWithFormat:@"%g",self.PortStepper.value];
}

- (IBAction)ChevStepPressed:(id)sender {
    self.Tele_ChevalDeFriseValueTextField.text=[NSString stringWithFormat:@"%g",self.ChevalStepper.value];
}

- (IBAction)RamStepPressed:(id)sender {
    
    self.Tele_RampartsValueTextField.text=[NSString stringWithFormat:@"%g",self.RamSteppers.value];
}

- (IBAction)MoatStepPressed:(id)sender {
      self.Tele_MoatValueTextField.text=[NSString stringWithFormat:@"%g",self.MoatStepper.value];
}
- (IBAction)DrawStepPressed:(id)sender {
    self.Tele_DrawbridgeValueTextField.text=[NSString stringWithFormat:@"%g",self.DrawStepper.value];
}

- (IBAction)SallyStepPressed:(id)sender {
    self.Tele_SallyPortValueTextField.text=[NSString stringWithFormat:@"%g",self.SallyStepper.value];

}

- (IBAction)RockStepPressed:(id)sender {
 
    self.Tele_RockWallValueTextField.text=[NSString stringWithFormat:@"%g",self.RockStepper.value];

}

- (IBAction)RoughStepPressed:(id)sender {

    self.Tele_RoughTerrainValueTextField.text=[NSString stringWithFormat:@"%g",self.RoughStepper.value];
}

-(IBAction)LowStepPressed:(id)sender {
    self.Tele_LowBarValueTextField.text=[NSString stringWithFormat:@"%g",self.LowStepper.value];
}




@end
