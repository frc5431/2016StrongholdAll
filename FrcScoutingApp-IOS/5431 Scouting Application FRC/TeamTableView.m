//
//  TeamTableView.m
//  5431 Scouting Application FRC
//
//  Created by Kedar Brooks on 4/1/16.
//  Copyright © 2016 Titian Robotics. All rights reserved.
//

#import "TeamTableView.h"

@implementation TeamTableView {
    NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     NSArray *T =  [ NSArray arrayWithObjects:@"57 Leopards",@"118 Robonauts",@"233 The Pink Team",@"233 High Voltage",@"441 Devil Dogs", @"624 CRyptonite",@"1255 Blargefish",@"1421 Team Chaos",@"1477 Texas Torque",@"1642 Techno-Cats",@"2080 Torbotics",@"2352 Metal Mayhem",@"2582 PantherBots",@"2585 Impact",@"2587 DiscoBots",@"2881 Lady Cans",@"2882 Nuts n Boltz",@"2897 Raven Robotics",@"2950 Devastators",@"3016 CyCreek Crusaders",@"3029 T-STEM Titans",@"3103 Iron Plaid"@"3240 Team Orion",@"335 Cy-Borgs",@"3345 Metal Jacks",@"3545 Stacey Robotics",@"3616 Team Phenomena",@"3728 RoboTiger",@"3735 Klein Bots",@"3741 CORE G IX",@"3743 Eagle Robotics",@"3834 Crab-bots",@"3847 Spectrum",@"3991 KnightVision",@"3997 Screaming Chickens",@"3999 Shadetree Robotics",@"4155 SHARC",@"4295 Hudson Robotics",@"4328 Furious Falcons",@"4336 Ramageddon",@"4355 CP-BOTS",@"4587 Jersey Voltage",@"4610 BearTecs",@"4639 RoboSpartans",@"4641 PEN",@"4731 MONARCH-E",@"5070 Gearnotics",@"5261 Cyber Shock",@"5414 Pearadox",@"5414 Pearadox",@"5416 TaRDIS",@"5427 Steel Talons or Tompkins Robotics",@"Titan Robotics",@"5503 Smithville Tiger Trons",@"5566 Sugar Rush",@"5829 AwtyBots",@"5892 High Energy",@"5908 Spartans",@"5923 Juggerbots",@"6095 PARDUX",@"6111 Battle Guard",@"6133 Haltom Robotics",@"6173 Elgin Metal Mayhem",@"6180 JDA Lions",@"6196 Spontaneous Disassembly",@"6235 Robo-Nerds", nil];
    tableData = T;
    
    NSLog(@"%@",tableData);
  
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}


@end
