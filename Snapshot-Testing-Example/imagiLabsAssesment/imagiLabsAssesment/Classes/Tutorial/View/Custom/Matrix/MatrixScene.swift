//
//  MatrixScene.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 06/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit
import SpriteKit

// Displays the color matrix
class MatrixScene: SKScene {
    
    // The width of each shape
    var squareWidth: CGFloat {
        return size.width / 10.0
    }
    
    // Contains the color information for each element
    var colorMatrix: [[UIColor]]? {
        didSet {
            removeAllChildren()
            
            addSquares()
            addLabels()
        }
    }
}

//MARK: - Private

extension MatrixScene {
    
    // Adds the labels to display the indexes of each row and column
    func addLabels() {
        let squareSpace = squareWidth / 10.0
        
        for index in 0..<8 {
            let horizontalLabelX = (squareWidth / 2 + squareWidth) + CGFloat(index) * (squareWidth + squareSpace)
            let horizontalLabelY = size.width - squareWidth + squareWidth / 6
            let verticalLabelX = squareWidth / 2 - squareSpace * 2
            let verticalLabelY = size.width - (2 * squareWidth ) - CGFloat(index) * (squareWidth + squareSpace)
            
            addLabel(with: "\(index)", color: .imagiLightBlue, position: CGPoint(x: horizontalLabelX, y: horizontalLabelY))
            addLabel(with: "\(index)", color: .imagiPink, position: CGPoint(x: verticalLabelX, y: verticalLabelY))
        }
    }
    
    // Adds a colored square for each element in the matrix
    func addSquares() {
        guard let matrix = colorMatrix else {
            return
        }
        
        let squareSpace = squareWidth / 10.0
        
        for row in 0..<8 {
            for column in 0..<8 {
                let color = matrix[row][column]
                let squareX = (squareWidth / 2 + squareWidth) + CGFloat(column) * (squareWidth + squareSpace)
                let squareY = size.width - (squareWidth / 2 + squareWidth + squareWidth / 6) - CGFloat(row) * (squareWidth + squareSpace)
                
                addSquare(size: CGSize(width: squareWidth, height: squareWidth), color: color, position: CGPoint(x: squareX, y: squareY))
            }
        }
    }
    
    // Adds an index label to the scene
    func addLabel(with text: String, color: UIColor, position: CGPoint) {
        let font = UIFont.avenirNextRegularFont(ofSize: squareWidth * 0.85)!
        
        let labelNode = SKLabelNode(text: "\(text)")
        labelNode.fontColor = color
        labelNode.fontSize = font.pointSize
        labelNode.fontName = font.fontName
        labelNode.position = position
        addChild(labelNode)
    }
    
    // Adds a colored square to the scene
    func addSquare(size: CGSize, color: UIColor, position: CGPoint) {
        let square = SKShapeNode(rectOf: size, cornerRadius: squareWidth / 10.0)
        square.fillColor = color
        square.strokeColor = UIColor.clear
        square.position = position
        addChild(square)
    }
}
