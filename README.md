# Martian Robot

This is an iOS app built using Swift programming language. the app processes the movement of a Robot on the surface of mars according to the instructions provided from Earth. The app is written
using MVVM architecture.

## Project Description 

This app defines a robot struct to keep track of each robot's position on the grid, orientation and also keeps track of its wherebouts on the grid to know if 
its lost. The orientations are represented using an array, and the dx and dy arrays to store the changes in coordinates based on the current orientation. 
The processRobots function parses the input and processes each robot's instructions, updating their position and orientation accordingly. 
Regarding testing, i have used XCtest Framework to test various edge cases. These test cases covers scenarios where there is a single robot, 
multiple robots, robots getting lost and robots moving out of the grid's boundaries,.....

## Table of Contents

In the structure files contains: robot struct , View, ViewModel, Network and tests part. 

# Installation
Can be used with Xcode 14 and above. Compatible with iPhone and iPad with minimum iOS version 15.0.

# Framework
UIKit, XCTest Framework, 

# Architecture
This application uses MVVM architecture

# Offline Storage
None

# Testing
Units tests viewModel for success and failure situations.

<img width="1210" alt="Screenshot 2023-09-01 at 19 05 03" src="https://github.com/yvesduke/MartianRobotsApp/assets/8191486/25aef084-6c65-4f42-940f-d0df3f80434b">

# Screens Recording

https://github.com/yvesduke/MartianRobotsApp/assets/8191486/0ceb2fe0-e4df-475a-af3a-3b95c6063581

