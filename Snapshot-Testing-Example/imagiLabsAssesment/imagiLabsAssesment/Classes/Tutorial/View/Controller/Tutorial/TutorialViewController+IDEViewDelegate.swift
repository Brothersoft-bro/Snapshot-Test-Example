//
//  TutorialViewController+IDEViewDelegate.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 06/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation

extension TutorialViewController: IDEViewDelegate {
    
    // Called when the debug button is selected
    func ideViewDidSelectDebugButton(ideView: IDEView) {
        delegate?.tutorialViewControllerDidSelectDebugButton(tutorialViewController: self)
    }
}
