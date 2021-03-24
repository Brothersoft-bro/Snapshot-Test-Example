//
//  TutorialViewController+Actions.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

extension TutorialViewController {
    
    // Called when the bottom button is tapped
    @IBAction func bottomButtonTapped() {
        delegate?.tutorialViewControllerDidSelectBottomButton(tutorialViewController: self)
    }
    
    // Called when the close button is tapped
    @IBAction func closeButtonTapped() {
        delegate?.tutorialViewControllerDidSelectCloseButton(tutorialViewController: self)
    }
}
