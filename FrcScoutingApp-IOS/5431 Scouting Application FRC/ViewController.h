//
//  ViewController.h
//  5431 Scouting Application FRC
//
//  Created by Titian Robotics on 1/27/16.
//  Copyright © 2016 Titian Robotics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Public Data Resource Decleraton
extern NSString *teamnumber;
extern NSString *matchnumber;

//
@property (nonatomic, strong)NSArray *AutoData;


// DataObjects ( String )
@property (strong, nonatomic) IBOutlet UITextField *PortVal;
@property (strong, nonatomic) IBOutlet UITextField *ChevVal;
@property (strong, nonatomic) IBOutlet UITextField *MoatVal;
@property (strong, nonatomic) IBOutlet UITextField *RamVal;
@property (strong, nonatomic) IBOutlet UITextField *DrawVal;
@property (strong, nonatomic) IBOutlet UITextField *SalVal;
@property (strong, nonatomic) IBOutlet UITextField *RockVal;
@property (strong, nonatomic) IBOutlet UITextField *RoughVal;
@property (strong, nonatomic) IBOutlet UITextField *LowVal;


//Auton Objects
@property (strong, nonatomic) IBOutlet UISwitch *PortStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *PortReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *PortCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *ChevalStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ChevalReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ChevalCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *MoatStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *MoatReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *MoatCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *RampartsStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RampartsReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RampartsCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *DrawbridgeStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *DrawbridgeReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *DrawbridgeCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *SallyportStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SallyportReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SallyportCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *RockwallStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RockwallReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RockwallCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *RoughTerrainStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RoughTerrainReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RoughTerrainCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *LowbarStartedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LowbarReachedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LowbarCrossedSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *spybotSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *swbSeg;
@property (weak, nonatomic) IBOutlet UITextView *autonCommentsTextView;
@property (weak, nonatomic) IBOutlet UITextField *MatchNumberTextView;
@property (weak, nonatomic) IBOutlet UITextField *TeamNumberTextView;
@property (weak,nonatomic) IBOutlet UISegmentedControl *AutoShot;

- (IBAction)saveAutonData:(id)sender;
- (IBAction)saveTeleopDataOne:(id)sender;

// Tele-op Objects

@property (weak, nonatomic) IBOutlet UITextField *Tele_PortcullisValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_ChevalDeFriseValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_MoatValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_RampartsValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_DrawbridgeValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_SallyPortValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_RockWallValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_RoughTerrainValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *Tele_LowBarValueTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_PortcullisAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_ChevalDeFriseAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_MoatAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_RampartsAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_SallyPortAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_RockWallAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_RoughTerranAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_LowBarAbilitySeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Tele_DrawbridgeAbilitySeg;

@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_PortSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_ChevSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_MoatSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_RampSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_SallySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_RockSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_RoughSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_LowBarSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HAPC_Tele_DrawSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *HTC_ele_PortSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_ChevSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_MoatSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_RampSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_SallySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_RockSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_RoughSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_LowBarSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HTC_Tele_DrawSwitch;

@property (weak, nonatomic) IBOutlet UIStepper *PortStepper;
@property (weak, nonatomic) IBOutlet UIStepper *ChevalStepper;
@property (weak, nonatomic) IBOutlet UIStepper *MoatStepper;
@property (weak, nonatomic) IBOutlet UIStepper *RamSteppers;
@property (weak, nonatomic) IBOutlet UIStepper *DrawStepper;
@property (weak, nonatomic) IBOutlet UIStepper *SallyStepper;
@property (weak, nonatomic) IBOutlet UIStepper *RockStepper;
@property (weak, nonatomic) IBOutlet UIStepper *RoughStepper;
@property (weak, nonatomic) IBOutlet UIStepper *LowStepper;

- (IBAction)PortStepPressed:(id)sender;
- (IBAction)ChevStepPressed:(id)sender;
- (IBAction)RamStepPressed:(id)sender;
- (IBAction)DrawStepPressed:(id)sender;
- (IBAction)SallyStepPressed:(id)sender;
- (IBAction)RockStepPressed:(id)sender;
- (IBAction)RoughStepPressed:(id)sender;
- (IBAction)LowStepPressed:(id)sender;
- (IBAction)MoatStepPressed:(id)sender;



// Tele-op Part 2 Objects

- (IBAction)SaveTeleop2Data:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *LGSTextField;
@property (weak, nonatomic) IBOutlet UITextField *LGFTextField;
@property (weak, nonatomic) IBOutlet UITextField *HGSTextField;
@property (weak, nonatomic) IBOutlet UITextField *HGFTextField;
@property (weak, nonatomic) IBOutlet UITextField *TF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ScalledSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ChallangedSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *WZASeg;
@property (weak, nonatomic) IBOutlet UISwitch *PDSwitch;
@property (weak, nonatomic) IBOutlet UITextView *TeleopCommentsTextBox;
@property (weak, nonatomic) IBOutlet UITextView *TeleopComments2TextBox;

@property (weak, nonatomic) IBOutlet UIStepper *LGFStepper;
- (IBAction)LGFPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *LGSStepper;
- (IBAction)LGSPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *TFStepper;
- (IBAction)TFPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *HGFStepper;
- (IBAction)HGFPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *HGSStepper;
- (IBAction)HGSPressed:(id)sender;





- (IBAction)AutonBack:(id)sender;

- (IBAction)Teleop1Back:(id)sender;

- (IBAction)Teleop2Back:(id)sender;

- (IBAction)Teleop2Backsave:(id)sender;




















@end

