//
//  RobotActionsProtocol.swift
//  MartianRobotsApp
//
//  Created by Yves Dukuze on 01/09/2023.
//

import Foundation
protocol RobotActions{
    func processRobots(input: String) throws -> [String]
}
