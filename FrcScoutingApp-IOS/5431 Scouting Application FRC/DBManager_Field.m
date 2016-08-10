//
//  DBManager_Field.m
//  5431 Scouting Application FRC
//
//  Created by Kedar Brooks on 3/22/16.
//  Copyright © 2016 Titian Robotics. All rights reserved.
//

#import "DBManager_Field.h"
static DBManager_Field *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager_Field : NSObject



+(DBManager_Field*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"student.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "create table if not exists studentsDetail (regno integer primary key, name text, department text, year text)";
            
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

- (BOOL) saveData:(NSString*)teamNumber matchNumber:(NSString*)matchNumber
     autonComment:(NSString*)autonComment portullisStarted:(NSString*)portullisStarted portullisReached:(NSString*)portullisReached portullisCrossed:(NSString*)portullisCrossed chevalStarted:(NSString*)chevalStarted chevalReached:(NSString*)chevalReached chevalCrossed:(NSString*)chevalCrossed moatStarted:(NSString*)moatStared moatReached:( NSString*)moatReached moatCrossed:(NSString*)moatCrossed rampartsStarted:(NSString*)rampartsStarted rampartsReached:(NSString*)rampartsReached rampartsCrossed:(NSString*)rampartsCrossed drawbridgeStarted:(NSString*)drawbridgeStarted drawbridgeReached:(NSString*)drawbridgeSReached drawbridgeCrossed:(NSString*)drawbridgeCrossed sallyportStarted:(NSString*)sallyportStarted sallyportReached:(NSString*)sallyportReached sallyportCrossed:(NSString*)sallyportCrossed rockwallStarted:(NSString*)rockwallStarted rockwallReached:(NSString*)rockwallReached rockwallCrossed:(NSString*)rockwallCrossed roughterrainStarted:(NSString*)roughterrainStarted roughterrainReached:(NSString*)roughterrainReached roughterrainCrossed:(NSString*)roughterrainCrossed lowbarStarted:(NSString*)lowbarStarted lowbarReached:(NSString*)lowbarReached lowbarCrossed:(NSString*)lowbarCrossed spybot:(BOOL*)spybot swb:(BOOL*)swb;
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into studentsDetail (teamNumber,teamNumber, autonComment) values (\"%d\",\"%@\", \"%@\"\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\",\"%ld\")",[teamNumber integerValue],matchNumber, autonComment, (long)[portullisStarted integerValue], (long)[portullisReached integerValue], (long)[portullisCrossed integerValue], (long)[chevalStarted integerValue], (long)[chevalReached integerValue], (long)[chevalCrossed integerValue], (long)[moatStared integerValue], (long)[moatReached integerValue], (long)[moatCrossed integerValue] , (long)[rampartsStarted integerValue], (long)[rampartsReached integerValue], (long)[rampartsCrossed integerValue],(long)[drawbridgeStarted integerValue], (long)[drawbridgeSReached integerValue], (long)[drawbridgeCrossed integerValue], (long)[sallyportStarted integerValue], (long)[sallyportReached integerValue], (long)[sallyportCrossed integerValue], (long)[rockwallStarted integerValue], (long)[rockwallReached integerValue], (long)[rockwallCrossed integerValue], (long)[roughterrainStarted integerValue], (long)[roughterrainReached integerValue], (long)[roughterrainCrossed integerValue], (long)[lowbarStarted integerValue], (long)[lowbarReached integerValue], (long)[lowbarCrossed integerValue], spybot, swb];
                                const char *insert_stmt = [insertSQL UTF8String];
                               
                                sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
                                if (sqlite3_step(statement) == SQLITE_DONE)
                               
                                {
                                    return YES;
                                } 
                                else {
                                    return NO;
                                }
                                sqlite3_reset(statement);
                                }
                                return NO;
                                }

@end


