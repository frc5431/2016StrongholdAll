//
//  FRCDataModel.swift
//  5431 Scouting Application FRC
//
//  Created by learner on 2/5/16.
//  Copyright © 2016 Titian Robotics. All rights reserved.
//

import UIKit

class FRCTeams {
// Team Bio Data
    
    let TeamName : String
    let TeamNumber : String
    let TeamType : String
    let RobotType : String
    let TeamBIo : String
    
// Team Performace Data
    
    let PortcullsScore : String
    let PortcullsSpeed : String
    let RampartScore : String
    let RampartSpeed : String
    let RockWallScore : String
    let RockWallSpeed : String
    let RoughTerrainScore : String
    let RoughTerrainSpeed : String
    let SallyPortScore : String
    let SallyPortSpeed : String
    let ChevalDeFrise : String
    let DrawbridgeScore : String
    let DrawbridgeSpeed : String
    let LowBarScore : String
    let LowBarSpeed : String
    let MoatScore : String
    let MoatSpeed : String
    
// Game Fied Stats 
    
    let DefensivePushing : String
    let ClimbingTower : String
    let BoulderPickup : String
    let ChallengedTowers : String
    
// Auto Task Statistics 
    
    let BoulderStart : String
    let DefenseReached : String
    let CrossedDefense : String
    let LowGoalScore : String
    let LowGoalFails : String
    let HighGoalScore : String
    let HighGoalFails : String

// initalizer
    init( TeamName: String, TeamNumber: String, TeamType: String, RobotType: String, TeamBio: String, PortcullsScore: String, PortcullsSpeed: String, RampartScore: String, RampartSpeed: String, RockWallScore: String, RockWallSpeed: String, RoughTerrainScore: String, RoughTerrainSpeed: String, SallyPortScore: String, SallyPortSpeed: String, ChevalDeFrise: String, DrawbridgeScore: String, DrawbridgeSpeed: String, LowBarScore: String, LowBarSpeed: String, MoatScore: String, MoatSpeed: String, DefensivePushing: String, ClimbingTower: String, BoulderPickup: String, ChallengedTowers: String, BoulderStart: String, DefenseReached: String, CrossedDefense: String, LowGoalScore: String, LowGoalFails: String, HighGoalScore: String, HighGoalFails: String) {
        
        
        self.TeamName = TeamName
        self.TeamNumber = TeamNumber
        self.TeamType = TeamType
        self.RobotType = RobotType
        self.TeamBIo = TeamBio
        self.PortcullsScore = PortcullsScore
        self.PortcullsSpeed = PortcullsSpeed
        self.RampartScore = RampartScore
        self.RampartSpeed = RampartSpeed
        self.RockWallScore = RockWallScore
        self.RockWallSpeed = RockWallSpeed
        self.RoughTerrainScore = RoughTerrainScore
        self.RoughTerrainSpeed = RoughTerrainSpeed
        self.SallyPortScore = SallyPortScore
        self.SallyPortSpeed = SallyPortSpeed
        self.ChevalDeFrise = ChevalDeFrise
        self.DrawbridgeScore = DrawbridgeScore
        self.DrawbridgeSpeed = DrawbridgeSpeed
        self.LowBarScore = LowBarScore
        self.LowBarSpeed = LowBarSpeed
        self.MoatScore = MoatScore
        self.MoatSpeed = MoatSpeed
        self.DefensivePushing = DefensivePushing
        self.ClimbingTower = ClimbingTower
        self.BoulderPickup = BoulderPickup
        self.ChallengedTowers = ChallengedTowers
        self.BoulderStart = BoulderStart
        self.DefenseReached = DefenseReached
        self.CrossedDefense = CrossedDefense
        self.LowGoalScore = LowGoalScore
        self.LowGoalFails = LowGoalFails
        self.HighGoalScore = HighGoalScore
        self.HighGoalFails = HighGoalFails
        
    
    
    }
}