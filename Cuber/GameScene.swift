//
//  GameScene.swift
//  Cuber
//
//  Created by Natasha Martinez on 8/23/17.
//  Copyright © 2017 natashamartinez. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var curDrag: DragPiece?
    var isDragging: Bool = false
    
    override func didMove(to view: SKView) {
        
        // Set up a for grid
        let margin = self.frame.width / 12
        let sideLength = self.frame.width - (margin * 2)
        
        // Create grid
        let grid = GridBasic(gridSize: sideLength)
        grid.position.x = 0
        grid.position.y = margin * 2
        self.addChild(grid)
        
        // Create pieces
        let dragPiece = DragPiece(sideLength: grid.sideLength)
        dragPiece.position.x = self.frame.width  / 4 * -1
        dragPiece.position.y = self.frame.height / 3 * -1
        self.addChild(dragPiece)
        self.curDrag = dragPiece
    }
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//    
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//    
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let curDrag = self.curDrag else { return }
        
        for touch in touches {
            if (curDrag.contains(touch.location(in: self))) {
                self.isDragging = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (self.isDragging == false) { return }
        
        guard
            let touch = touches.first,
            let curDrag = self.curDrag
        else { return }
        
        curDrag.position = touch.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        self.touchesEnded(location: touch.location(in: self))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        self.touchesEnded(location: touch.location(in: self))
    }
    
    func touchesEnded(location: CGPoint) {
        
        guard let curDrag = self.curDrag else { return }
        
        curDrag.position.x = self.frame.width  / 4 * -1
        curDrag.position.y = self.frame.height / 3 * -1
        
        self.isDragging = false
    }
    
//    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
}
