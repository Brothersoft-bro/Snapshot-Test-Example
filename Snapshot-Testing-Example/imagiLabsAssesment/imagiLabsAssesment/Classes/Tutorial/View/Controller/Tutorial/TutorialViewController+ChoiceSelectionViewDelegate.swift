//
//  TutorialViewController+Actions.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

extension TutorialViewController: ChoiceSelectionViewDelegate {
    
    // Called when a choice is selected
    func choiceSelectionView(choiceSelectionView: ChoiceSelectionView, didSelectButtonAt index: Int) {
        delegate?.tutorialViewController(tutorialViewController: self, didSelectChoiceAt: index)
    }
}
