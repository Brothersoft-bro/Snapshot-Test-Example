//
//  TutorialViewController+Actions.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation
import UIKit

extension TutorialViewController {
    
    // Sets the delegates
    func setupDelegates() {
        delegate = tutorialViewModel
        
        tutorialViewModel?.delegate = self
        choiceSelectionView.delegate = self
        bigCodeSnippetView.delegate = self
    }
    
    // Configures the UI
    func configureUI() {
        configureMatrixView()
        configureProgressView()
        configureTextView()
        configureBottomButton()
        configureChoiceSelectionView()
        configureBigCodeSnippetView()
        configureSmallCodeSnippetView()
    }
    
    // Configures the matrix view
    func configureMatrixView() {
        matrixView.isHidden = tutorialViewModel?.currentStep.matrix == nil ? true : false
        matrixView.colorMatrix = tutorialViewModel?.currentStep.matrix
    }
    
    // Configures the progress view
    func configureProgressView() {
        progressView.progressPercentage = tutorialViewModel?.currentStep.progress ?? 0.0
    }
    
    // Configures the choice selection view
    func configureChoiceSelectionView() {
        guard
            let choices = tutorialViewModel?.currentStep.choices,
            choices.count >= 3 else {
                choiceSelectionView.isHidden = true
                
                return
        }
        
        choiceSelectionView.isHidden = false
        
        for index in 0..<3 {
            let choice = choices[index]
            let choiceButton = choiceSelectionView.viewWithTag(index + 1) as! UIButton
            
            choiceButton.setTitle(choice.title, for: .normal)
            choiceButton.backgroundColor = (choice.selected && !choice.isCorrect) ? choice.color.withAlphaComponent(0.5) : choice.color
        }
    }
    
    // Configures the title/question textview
    func configureTextView() {
        titleTextView.contentOffset = .zero
        titleTextView.text = tutorialViewModel?.currentStep.title
    }
    
    // Configures the appearance of the collapsed IDE
    func configureSmallCodeSnippetView() {
        guard
            let codeSnippet = tutorialViewModel?.currentStep.codeSnippet,
            tutorialViewModel?.currentStep.codeSnippetExpanded == false else {
                smallCodeSnippetViewHeightConstraint.constant = 0
                smallCodeSnippetView.expanded = false
                
                return
        }
        
        smallCodeSnippetViewHeightConstraint.constant = 55
        smallCodeSnippetView.expanded = false
        smallCodeSnippetView.codeTextView.text = codeSnippet
    }
    
    // Configures the appearance of the fullscreen IDE
    func configureBigCodeSnippetView() {
        bigCodeSnippetView.isHidden = tutorialViewModel?.currentStep.codeSnippetExpanded == true ? false : true
    }
    
    // Configures the appearance of the bottom button
    func configureBottomButton() {
        guard
            let buttonState = tutorialViewModel?.currentStep.buttonState,
            let buttonEnabled = tutorialViewModel?.currentStep.buttonEnabled else {
                bottomButton.isHidden = true
                
                return
        }
        
        bottomButton.isHidden = false
        bottomButton.backgroundColor =  buttonState.color()
        bottomButton.setTitle(buttonState.description(), for: .normal)
        bottomButton.setTitleColor(buttonState == .check ? UIColor.imagiGrayTextColor : UIColor.imagiBlackTextColor, for: .normal)
        bottomButton.isUserInteractionEnabled = buttonEnabled
    }
    
    // Used to display the congratulations screen
    func showTutorialFinishedViewController() {
        let congratulationsViewController = CongratulationsViewController()
        navigationController?.pushViewController(congratulationsViewController, animated: false)
    }
}
