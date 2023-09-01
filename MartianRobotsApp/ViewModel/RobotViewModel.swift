//
//  RobotViewModel.swift
//  MartianRobotsApp
//
//  Created by Yves Dukuze on 01/09/2023.
//

import Foundation

class RobotViewModel{
    // Define the possible orientations
    let orientations: [Character] = ["N", "E", "S", "W"]

    // Define the movements for each orientation
    let dx: [Int] = [0, 1, 0, -1]
    let dy: [Int] = [1, 0, -1, 0]

}

extension RobotViewModel:RobotActions{
    
    func processRobots(input: String) throws -> [String] {
        
        guard !input.isEmpty else {
            throw CustomError.emptyStringInputError
        }
        
        guard input.contains(" ") else {
            throw CustomError.nonSpaceInputError
        }
        
        guard input.contains("\n") else {
            throw CustomError.nonNewLineInputError
        }
        
        let lines = input.components(separatedBy: "\n")
        
        guard lines.count > 2 else {
            throw CustomError.invalidInput
        }
        
        let gridSize = lines[0].split(separator: " ").map {Int($0)!}

        var results: [String] = []
        
        for i in stride(from: 1, to: lines.count, by: 2) {
            let position = lines[i].split(separator: " ")
            var robot = Robot(x: Int(position[0])!, y: Int(position[1])!, orientation: Character(position[2].uppercased()))
            
            let instructions = Array(lines[i + 1])
            for instruction in instructions {
                if instruction == "L" {
                    let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                    robot.orientation = orientations[(currentOrientationIndex + 3) % 4]
                } else if instruction == "R" {
                    let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                    robot.orientation = orientations[(currentOrientationIndex + 1) % 4]
                } else if instruction == "F" {
                    let currentOrientationIndex = orientations.firstIndex(of: robot.orientation)!
                    let newX = robot.x + dx[currentOrientationIndex]
                    let newY = robot.y + dy[currentOrientationIndex]
                    
                    if newX >= 0 && newY >= 0 && newX <= gridSize[0] && newY <= gridSize[1] {
                        robot.x = newX
                        robot.y = newY
                    } else if !robot.isLost {
                        robot.isLost = true
                        break
                    }
                }
            }
            
            results.append(robot.isLost ? "\(robot.x)\(robot.y)\(robot.orientation)LOST" : "\(robot.x)\(robot.y)\(robot.orientation)")
        }
        
        return results
    }
    
    
}
