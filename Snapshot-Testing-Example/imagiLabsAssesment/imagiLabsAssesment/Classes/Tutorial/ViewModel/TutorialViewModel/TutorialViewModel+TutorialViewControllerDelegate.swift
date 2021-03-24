//
//  TutorialViewModel+TutorialViewControllerDelegate.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

// Used to notify the delegate object about UI changes in the view controller
extension TutorialViewModel: TutorialViewControllerDelegate {
    
    // Called when a choice is selected
    func tutorialViewController(tutorialViewController: TutorialViewController, didSelectChoiceAt index: Int) {
        updateChoice(at: index)
    }
    
    // Called when the button in the bottom of the screen is selected
    func tutorialViewControllerDidSelectBottomButton(tutorialViewController: TutorialViewController) {
        moveToNextStep()
    }
    
    // Called when the debug button is selected
    func tutorialViewControllerDidSelectDebugButton(tutorialViewController: TutorialViewController) {
        moveToNextStep()
    }
    
    // Called when the close button is selected
    func tutorialViewControllerDidSelectCloseButton(tutorialViewController: TutorialViewController) {
        
    }
}
