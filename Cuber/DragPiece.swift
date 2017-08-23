//
//  DragPiece.swift
//  Cuber
//
//  Created by Natasha Martinez on 8/23/17.
//  Copyright © 2017 natashamartinez. All rights reserved.
//

import SpriteKit
import GameplayKit

class DragPiece: SKSpriteNode {
    
    var sideLength: CGFloat!
    
    convenience init(sideLength: CGFloat) {
        self.init()
        
        self.sideLength = sideLength
        
        self.createL()
    }
    
    private func createL() {
        
        // Yellow color
        let color = UIColor.init(red: 214/255, green: 229/255, blue: 148/255, alpha: 1)
        
        // Top square
        let top = Square(sideLength: self.sideLength, fillColor: color)
        self.addChild(top)
        
        // Bottom square
        let bottom = Square(sideLength: self.sideLength, fillColor: color)
        bottom.position.y = self.sideLength
        self.addChild(bottom)
        
        // Bottom right square
        let bottomRight = Square(sideLength: self.sideLength, fillColor: color)
        bottomRight.position.x = self.sideLength
        bottomRight.position.y = self.sideLength
        self.addChild(bottomRight)
        
        // Update the size
        self.size = CGSize(width: self.sideLength * 2, height: self.sideLength * 2)
    }
}
