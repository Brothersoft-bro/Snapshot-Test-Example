//
//  TutorialViewController.swift
//  imagiLabs Assesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// Used to notify the delegate object about user interaction events in the UI
protocol TutorialViewControllerDelegate: AnyObject {
    
    // Called when a choice is selected
    func tutorialViewController(tutorialViewController: TutorialViewController, didSelectChoiceAt index: Int)
    
    // Called when the button in the bottom of the screen is selected
    func tutorialViewControllerDidSelectBottomButton(tutorialViewController: TutorialViewController)
    
    // Called when the close button is selected
    func tutorialViewControllerDidSelectCloseButton(tutorialViewController: TutorialViewController)
    
    // Called when the debug button is selected
    func tutorialViewControllerDidSelectDebugButton(tutorialViewController: TutorialViewController)
}

// Displays the UI of the whole tutorial
class TutorialViewController: UIViewController {
    
    // The matrix view
    @IBOutlet weak var matrixView: MatrixView!
    
    // The button in the bottom of the screen
    @IBOutlet weak var bottomButton: UIButton!
    
    // The progress view
    @IBOutlet weak var progressView: TutorialProgressView!
    
    // The choice selection view
    @IBOutlet weak var choiceSelectionView: ChoiceSelectionView!
    
    // The title/question view
    @IBOutlet weak var titleTextView: UITextView!
    
    // The view of the IDE in fullscreen
    @IBOutlet weak var bigCodeSnippetView: IDEView!
    
    // The view of the IDE in collapsed mode
    @IBOutlet weak var smallCodeSnippetView: IDEView!
    
    // The height constraint of the collapsed IDE. Used to layout the IDE and the choice selection view on the screen much easier.
    @IBOutlet weak var smallCodeSnippetViewHeightConstraint: NSLayoutConstraint!
    
    // The delegate object
    weak var delegate: TutorialViewControllerDelegate?
    
    // Contains all the data to be displayed in the UI
    var tutorialViewModel: TutorialViewModel?

    convenience init(viewModel: TutorialViewModel) {
        self.init()
        
        tutorialViewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        configureUI()
    }
}
