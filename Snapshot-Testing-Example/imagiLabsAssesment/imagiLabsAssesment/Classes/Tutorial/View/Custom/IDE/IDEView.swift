//
//  CodeSnippetView.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

// Used to notify the delegate object about user interaction events in the UI
protocol IDEViewDelegate: AnyObject {
    
    // Called when the debug button is tapped
    func ideViewDidSelectDebugButton(ideView: IDEView)
}

//MARK: - Lifecycle

// Contains the visual representation of a code editor
class IDEView: UIView {
    
    // Displays the index of each line of code
    @IBOutlet weak var indexTextView: UITextView!
    
    // Displays the code snippet
    @IBOutlet weak var codeTextView: UITextView!
    
    // The debug button
    @IBOutlet weak var debugButton: UIButton!
    
    var view: UIView!
    weak var delegate: IDEViewDelegate?
    
    var expanded: Bool = true {
        didSet {
            debugButton.isHidden = !expanded
            
            if expanded {
                codeTextView.layer.borderWidth = 0.0
                
                indexTextView.layer.borderWidth = 0.0
                indexTextView.textContainerInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 1.0)
            } else {
                
                // Add border and apply cornerRadius also
                codeTextView.layer.borderColor = UIColor.imagiGreen.cgColor
                codeTextView.layer.borderWidth = 2.0
                codeTextView.clipsToBounds = true
                codeTextView.layer.cornerRadius = 6.0
                codeTextView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                
                indexTextView.layer.borderColor = UIColor.imagiGreen.cgColor
                indexTextView.layer.borderWidth = 2.0
                indexTextView.clipsToBounds = true
                indexTextView.layer.cornerRadius = 6.0
                indexTextView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                indexTextView.textContainerInset = UIEdgeInsets(top: 8.0, left: 1.0, bottom: 8.0, right: 0.0)
            }
        }
    }
    
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

extension IDEView {
    private func initSubviews() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.isUserInteractionEnabled = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "IDEView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

//MARK: - Action

extension IDEView {
    
    // Called when the debug button is tapped
    @IBAction func debugButtonTapped() {
        delegate?.ideViewDidSelectDebugButton(ideView: self)
    }
}
