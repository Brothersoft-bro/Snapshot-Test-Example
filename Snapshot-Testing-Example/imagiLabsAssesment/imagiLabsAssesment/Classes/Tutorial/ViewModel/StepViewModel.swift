//
//  Step.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// The list of possible states of the button
enum StepButtonState {
    case check
    case tryAgain
    case next
    case nextWithDelay
    
    // Returns the text representation of the state
    func description() -> String {
        switch self {
        case .check:
            return "Check"
        case .tryAgain:
            return "Try Again"
        case .next, .nextWithDelay:
            return "Next"
        }
    }
    
    // Returns the background color attached to a given state
    func color() -> UIColor {
        switch self {
        case .check, .nextWithDelay:
            return UIColor.imagiLightGray
        case .next:
            return UIColor.imagiGreen
        case .tryAgain:
            return UIColor.imagiYellow
        }
    }
}

// Contains UI configuration information for a step
class StepViewModel: NSObject {
    
    // The progress value attached to the given step. It can be a value between [0, 100].
    var progress: Double = 0.0
    
    // The title/question of the step
    var title: String = ""
    
    // A 2 dimensional array containing the color of each element from the matrix. Empty elements in the array have black colors by default.
    var matrix: [[UIColor]]?
    
    // The choices for a given question
    var choices: [ChoiceViewModel]?
    
    // The string representation of the code displayed in the small IDE
    var codeSnippet: String?
    
    // Dertermines if the IDE needs to be displayed in full screeen or not
    var codeSnippetExpanded: Bool?
    
    // The state of the bottom button
    var buttonState: StepButtonState?
    
    // Determines if the bottom button can be selected by the user or not
    var buttonEnabled: Bool?
}
