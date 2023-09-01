//
//  RobotNavigationViewModelTests.swift
//  MartianRobotsAppTests
//
//  Created by Yves Dukuze on 01/09/2023.
//

import XCTest
@testable import MartianRobotsApp

final class RobotNavigationViewModelTests: XCTestCase {
    
    var viewModel: RobotViewModel!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //Given
        viewModel = RobotViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testSingleRobotNoLost() {
        
        //When
        let input = """
        5 3
        1 1 E
        RFRFRFRF
        """
        // Then
        let expectedOutput = ["11E"]
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testSingleRobotWithLost() {
        // When
        let input = """
        5 3
        3 2 N
        FRRFLLFFRRFLL
        """
        // Then
        let expectedOutput = ["33NLOST"]
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testMultipleRobotsNoLost() {
        // When
        let input = """
        5 3
        1 1 E
        RFRFRFRF
        3 2 N
        FRRFLLFFRRFLL
        """
        //Then
        let expectedOutput = ["11E", "33NLOST"]
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testMultipleRobotsWithLost() {
        //When
        let input = """
            5 3
            1 1 E
            RFRFRFRF
            0 3 W
            LLFFFLFLFL
            """
        // Then
        let expectedOutput = ["11E", "33NLOST"]
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertNil(error)
        }
    }
    
    
    func testRobotsOutOfRange() {
        // When
        let input = """
        5 3
        1 1 E
        FFFFFFFF
        """
        // Then
        let expectedOutput = ["51ELOST"]
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertNil(error)
        }
    }
    
    
    func testEmptyInput() {
        // When
        let input = ""
        
        // Then
        let expectedOutput: [String] = []
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertEqual(error as! CustomError, CustomError.emptyStringInputError)
        }
        
    }
    
    func testnotSpaceInInputString() {
        // When
        let input = "DLSJHFLSKD"
        
        // Then
        let expectedOutput: [String] = []
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertEqual(error as! CustomError, CustomError.nonSpaceInputError)
        }
        
    }
    
    func testnotNewLineInInputString() {
        // When
        let input = "DLSJHF LSKD"
        
        // Then
        let expectedOutput: [String] = []
        do {
            let output = try viewModel.processRobots(input: input)
            XCTAssertEqual(output, expectedOutput)

        } catch {
            XCTAssertEqual(error as! CustomError, CustomError.nonNewLineInputError)
        }
        
    }
    
    
}
