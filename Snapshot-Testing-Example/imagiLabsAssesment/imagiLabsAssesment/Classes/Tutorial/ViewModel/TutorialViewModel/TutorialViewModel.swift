//
//  TutorialViewModel.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// Used to notify the delegate object about data changes in the view model
protocol TutorialViewModelDelegate: AnyObject {
    
    // Called when the selected property of a given choice object is updated
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didUpdateChoice choice: ChoiceViewModel)
    
    // Called when the button state is changed
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didUpdateButtonState state: StepButtonState?)
    
    // Called when the current step is changed
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didChangeStep step: StepViewModel)
    
    // Called after all the steps of the tutorial is completed
    func tutorialViewModelDidFinishTutorial(tutorialViewModel: TutorialViewModel)
}

// The purpose of these kinds of classes is to transform model information into data what can be displayed easily by view objects. The TutorialViewModel class is responsible to transform tutorial related information into displayable information.
class TutorialViewModel {
    
    // The delegate object
    weak var delegate: TutorialViewModelDelegate?
    
    // Contains all the steps information of the tutorial
    var steps: [StepViewModel] = []
    
    // Determines the index of the current step
    var currentStepIndex = 0
    
    // Returns the current step object
    var currentStep: StepViewModel {
        return steps[currentStepIndex]
    }

    init() {
        setupViewModel()
    }
}
