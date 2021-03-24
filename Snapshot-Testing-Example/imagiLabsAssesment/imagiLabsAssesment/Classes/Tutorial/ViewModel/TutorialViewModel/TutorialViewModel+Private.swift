//
//  TutorialViewModel+Private.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 07/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

extension TutorialViewModel {
    
    // Modifies the state of the button after a delay
    func enableButtonState(with delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            self.currentStep.buttonEnabled = true
            self.currentStep.buttonState = .next
            
            self.delegate?.tutorialViewModel(tutorialViewModel: self, didUpdateButtonState: self.currentStep.buttonState)
        })
    }
    
    // Changes the current step to the next one
    func moveToNextStep() {
        guard currentStepIndex < steps.count - 1 else {
            delegate?.tutorialViewModelDidFinishTutorial(tutorialViewModel: self)
            
            return
        }
        
        currentStepIndex += 1

        if currentStep.buttonState == .nextWithDelay {
            enableButtonState(with: 3.0)
        }
        
        delegate?.tutorialViewModel(tutorialViewModel: self, didChangeStep: currentStep)
    }
    
    // Updates choices information
    func updateChoice(at index: Int) {
        guard
            let choices = currentStep.choices,
            index < choices.count,
            currentStep.buttonState != .next else {
            return
        }
        
        let choice = choices[index]
        if choice.isCorrect {
            currentStep.buttonState = StepButtonState.next
            currentStep.buttonEnabled = true
            
            // In case of correct answer mark all the the choices selected
            for choice in choices {
                choice.selected = true
            }
        } else {
            choice.selected = true
            currentStep.buttonState = StepButtonState.tryAgain
            currentStep.buttonEnabled = false
        }
        
        delegate?.tutorialViewModel(tutorialViewModel: self, didUpdateChoice: choice)
    }
}
