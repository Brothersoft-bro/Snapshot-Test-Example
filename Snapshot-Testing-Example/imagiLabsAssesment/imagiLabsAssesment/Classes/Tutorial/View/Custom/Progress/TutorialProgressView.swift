//
//  ProgressView.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

//MARK: - Lifecycle

// The UI of the progress view
class TutorialProgressView: UIView {
    var view: UIView!

    // The percentage of the progress
    var progressPercentage: Double = 20.0 {
        didSet {
            setupProgressPath()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
}

//MARK: - Private

extension TutorialProgressView {
    private func initSubviews() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.isUserInteractionEnabled = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "TutorialProgressView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

//MARK: - UI

extension TutorialProgressView {
    
    // Configures the UI appearence of the progress
    func setupUI() {
        backgroundColor = .imagiBlackBackgroundColor
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 4.0
        layer.masksToBounds = true
        
        setupProgressPath()
    }
    
    // Draws the shape of the progress
    func setupProgressPath() {
        let lineDelta = 5.0
        let width = Double(frame.size.width)
        let height = Double(frame.size.height)
        let progressX = progressPercentage >= 100 ? width + lineDelta : progressPercentage / 100 * width
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: progressX, y: 0.0))
        path.addLine(to: CGPoint(x: progressX - lineDelta, y: height))
        path.addLine(to: CGPoint(x: 0.0, y: height))
        path.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path.close()
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.lineJoin = CAShapeLayerLineJoin.miter
        shape.fillColor = UIColor.imagiGreen.cgColor
        shape.path = path.cgPath
        layer.addSublayer(shape)
    }
}

