//
//  SelectionView.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// Used to notify the delegate object about user interaction events in the UI
protocol ChoiceSelectionViewDelegate: AnyObject {
    
    // Called when one of the choices is tapped
    func choiceSelectionView(choiceSelectionView: ChoiceSelectionView, didSelectButtonAt index: Int)
}

//MARK: - Lifecycle

// Contains the UI to display all the possible choices for a given question
class ChoiceSelectionView: UIView {
    
    // The first button
    @IBOutlet weak var choiceButton1: UIButton!
    
    // The second button
    @IBOutlet weak var choiceButton2: UIButton!
    
    // The third button
    @IBOutlet weak var choiceButton3: UIButton!
    
    var view: UIView!
    weak var delegate: ChoiceSelectionViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubviews()
    }
}

//MARK: - Private

extension ChoiceSelectionView {
    private func initSubviews() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.isUserInteractionEnabled = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "ChoiceSelectionView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

//MARK: - Action

extension ChoiceSelectionView {
    
    // Called when one of the choices is tapped
    @IBAction func buttonTapped(sender: UIButton) {
        self.delegate?.choiceSelectionView(choiceSelectionView: self, didSelectButtonAt: sender.tag - 1)
    }
}
