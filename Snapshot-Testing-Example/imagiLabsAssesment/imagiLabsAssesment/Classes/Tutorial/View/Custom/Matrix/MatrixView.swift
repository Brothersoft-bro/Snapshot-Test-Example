//
//  MatrixView.swift
//  imagiLabsAssesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit
import SpriteKit

//MARK: - Lifecycle

// Displays the color matrix
class MatrixView: UIView {
    var view: UIView!
    
    // Contains the color data of the matrix
    var colorMatrix: [[UIColor]]? {
        didSet {
            guard let scene = scene else {
                return
            }
            
            scene.colorMatrix = colorMatrix
        }
    }
    
    // Displays the scene and interacts with the other UIKit elements from the app
    var spriteKitView: SKView!
    
    // Used to draw the matrix(shapes, labels) used in the matrix
    var scene: MatrixScene!
    
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

extension MatrixView {
    private func initSubviews() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.isUserInteractionEnabled = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "MatrixView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

//MARK: - UI

extension MatrixView {
    
    // Configures the UI of the matrix
    func setupUI() {
        scene = MatrixScene(size: bounds.size)
        scene.backgroundColor = UIColor.imagiBlackBackgroundColor
        scene.colorMatrix = colorMatrix
        
        spriteKitView = SKView(frame: bounds)
        spriteKitView.presentScene(scene)
        addSubview(spriteKitView)
    }
}
