//
//  Choice.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// Contains UI configuration information for a choice button
class ChoiceViewModel: NSObject {
    
    // The title of the choice
    var title: String = ""
    
    // The background color of the choice
    var color: UIColor = UIColor.imagiRed
    
    // Determines if the choice is the correct one
    var isCorrect: Bool = false
    
    // Determines if the choice was selected already
    var selected: Bool = false
}
