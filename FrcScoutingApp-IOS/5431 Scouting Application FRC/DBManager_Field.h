//
//  DBManager_Field.h
//  5431 Scouting Application FRC
//
//  Created by Kedar Brooks on 3/22/16.
//  Copyright © 2016 Titian Robotics. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DBManager_Field : NSObject
{
    NSString *databasePath;
}

+(DBManager_Field*)getSharedInstance;
-(BOOL)createDB;

-(BOOL) saveData:(NSString*)teamNumber teamName:(NSString*)teamName
       autonComment:(NSString*)autonComment portullisStarted:(NSInteger*)portullisStarted portullisReached:(NSInteger)portullisReached portullisCrossed:(NSInteger*)portullisCrossed chevalStarted:(NSInteger*)chevalStarted chevalReached:(NSInteger*)chevalReached chevalCrossed:(NSInteger*)chevalCrossed moatStarted:(NSInteger*)moatStared moatReached:(NSInteger*)moatReached moatCrossed:(NSInteger*)moatCrossed rampartsStarted:(NSInteger*)rampartsStarted rampartsReached:(NSInteger*)rampartsReached rampartsCrossed:(NSInteger*)rampartsCrossed drawbridgeStarted:(NSInteger*)drawbridgeStarted drawbridgeReached:(NSInteger*)drawbridgeSReached drawbridgeCrossed:(NSInteger*)drawbridgeCrossed sallyportStarted:(NSInteger*)sallyportStarted sallyportReached:(NSInteger*)sallyportReached sallyportCrossed:(NSInteger*)sallyportCrossed rockwallStarted:(NSInteger*)rockwallStarted rockwallReached:(NSInteger*)rockwallReached rockwallCrossed:(NSInteger*)rockwallCrossed roughterrainStarted:(NSInteger*)roughterrainStarted roughterrainReached:(NSInteger*)roughterrainReached roughterrainCrossed:(NSInteger*)roughterrainCrossed lowbarStarted:(NSInteger*)lowbarStarted lowbarReached:(NSInteger*)lowbarReached lowbarCrossed:(NSInteger*)lowbarCrossed spybot:(BOOL*)spybot swb:(BOOL*)swb;
-(NSArray*) findByTeamNumber:(NSString*)teamNumbr;

@end
