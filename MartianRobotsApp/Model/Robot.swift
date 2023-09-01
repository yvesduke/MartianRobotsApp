//
//  Robot.swift
//  MartianRobotsApp
//
//  Created by Yves Dukuze on 01/09/2023.
//

import Foundation
// Defining a struct to represent a robot's position and orientation and its status if its lost or not
struct Robot {
    var x: Int
    var y: Int
    var orientation: Character
    var isLost: Bool = false
}
