//
//  Square.swift
//  Cuber
//
//  Created by Natasha Martinez on 8/23/17.
//  Copyright © 2017 natashamartinez. All rights reserved.
//

import SpriteKit
import GameplayKit

class Square: SKShapeNode {
    
    var marginOffset: CGFloat!

    override init() {
        super.init()
    }
    
    convenience init(sideLength: CGFloat) {
        self.init(sideLength: sideLength, fillColor: UIColor.init(red: 66 / 255, green: 68 / 255, blue: 89 / 255, alpha: 1))
    }
    
    convenience init(sideLength: CGFloat, fillColor: UIColor) {
    
        self.init()
        
        let margin = (sideLength / 8) / 2
        let frame = CGRect(
            x:      0,
            y:      0,
            width:  sideLength - (margin * 2),
            height: sideLength - (margin * 2)
        )
        
        self.init(rect: frame, cornerRadius: 5)
        
        self.fillColor = fillColor
        self.strokeColor = UIColor.clear
        
        self.marginOffset = margin
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
