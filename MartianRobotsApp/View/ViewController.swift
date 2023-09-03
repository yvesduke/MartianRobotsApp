//
//  ViewController.swift
//  MartianRobotsApp
//
//  Created by Yves Dukuze on 01/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let input1 = """
        5 3
        1 1 E
        RFRFRFRF
        """
    let input2 = """
        5 3
        3 2 N
        FRRFLLFFRRFLL
        """
    let input3 = """
        O 3 W
        LLFFFLFLFL
        """
    
//    let input3 = """
//        5 3
//        1 1 E
//        FFFFFFFF
//        """
    let robotViewModel = RobotViewModel()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputSampleLabel3: UILabel!
    @IBOutlet weak var inputSampleLabel2: UILabel!
    @IBOutlet weak var inputSampleLabel1: UILabel!
    @IBOutlet weak var invalidInputLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        title = "Martian Robots"
        inputSampleLabel1.text = input1
        inputSampleLabel2.text = input2
        inputSampleLabel3.text = input3
        invalidInputLabel.text = "Invalid Input"
    }
    
    @IBAction func performRobotAction(_ sender: Any) {

        let testInput = input1

        do {
            let output = try robotViewModel.processRobots(input: testInput)
            self.outputLabel.text = output.last
        } catch {
            showErrorMessage(errorString: error.localizedDescription)
        }
    }

    @IBAction func PerformRobotAction2(_ sender: UIButton) {
        let testInput = input2
       
        do {
            let output = try robotViewModel.processRobots(input: testInput)
            self.outputLabel.text = output.last
        } catch {
            showErrorMessage(errorString: error.localizedDescription)
        }
    }

    @IBAction func PerformRobotAction3(_ sender: UIButton) {

        let testInput = input3
        do {
            let output = try robotViewModel.processRobots(input: testInput)
            self.outputLabel.text = output.last
        } catch {
            showErrorMessage(errorString: error.localizedDescription)
        }
    }
    
    @IBAction func invalidInputButton(_ sender: UIButton) {

        guard let testInput = invalidInputLabel.text else { return  }

        do {
            let output = try robotViewModel.processRobots(input: testInput)
            self.outputLabel.text = output.last
        } catch {
            showErrorMessage(errorString: error.localizedDescription)
        }
    }

    func showErrorMessage(errorString: String){

        let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

