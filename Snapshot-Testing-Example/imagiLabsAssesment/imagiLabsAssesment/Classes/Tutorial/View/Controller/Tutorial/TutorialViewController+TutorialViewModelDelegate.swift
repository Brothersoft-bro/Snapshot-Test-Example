//
//  TutorialViewController+TutorialViewModelDelegate.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 06/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

extension TutorialViewController: TutorialViewModelDelegate {
    
    // Called when the button state is changed
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didUpdateButtonState state: StepButtonState?) {
        configureBottomButton()
    }
    
    // Called when the selected property of a given choice object is updated
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didUpdateChoice choice: ChoiceViewModel) {
        configureChoiceSelectionView()
        configureBottomButton()
    }
    
    // Called when the current step is changed
    func tutorialViewModel(tutorialViewModel: TutorialViewModel, didChangeStep step: StepViewModel) {
        configureUI()
    }
    
    // Called after all the steps of the tutorial is completed
    func tutorialViewModelDidFinishTutorial(tutorialViewModel: TutorialViewModel) {
        showTutorialFinishedViewController()
    }
}
