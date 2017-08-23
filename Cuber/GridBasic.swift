//
//  GridBasic.swift
//  Cuber
//
//  Created by Natasha Martinez on 8/23/17.
//  Copyright © 2017 natashamartinez. All rights reserved.
//

import SpriteKit
import GameplayKit

class GridBasic: SKSpriteNode {
    
    let gridLength: CGFloat
    var sideLength: CGFloat!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        // Square up the frame
        let smallerLength = (size.width < size.height) ? size.width : size.height
        
        // Init
        self.gridLength = smallerLength
        super.init(texture: texture, color: color, size: CGSize(width: smallerLength, height: smallerLength))
        
        // Grid
        self.createGrid()
    }

    init(gridSize: CGFloat) {
        
        // Init
        self.gridLength = gridSize
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: gridSize, height: gridSize))
        
        // Grid
        self.createGrid()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createGrid() {
        
        // Number of squares
        let numSquares = 8
        
        // Determine squares width
        self.sideLength = self.gridLength / CGFloat(numSquares)
        
        // Create the boxes
        for i in 0..<numSquares {
            for j in 0..<numSquares {
                
                self.createNode(xOffset: CGFloat(i), yOffset: CGFloat(j))
            }
        }
    }
    
    private func createNode(xOffset: CGFloat, yOffset: CGFloat) {
        
        // Make a square
        let node = Square(sideLength: self.sideLength)
        node.position.x = node.marginOffset + (xOffset * self.sideLength) - (self.gridLength / 2)
        node.position.y = node.marginOffset + (yOffset * self.sideLength) - (self.gridLength / 2)
        self.addChild(node)
    }
}




























