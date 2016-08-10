//
//  GameScene.swift
//  Trials of the Secret Garden tvOS
//
//  Created by fang on 16/8/9.
//  Copyright (c) 2016年 Yixiong Fang. All rights reserved.
//

import SpriteKit

class GameScene: SGScene {
  override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = lt("Language")
        myLabel.fontSize = 65
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
  
  // MARK: Life Cycle
   
  override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
  
  // MARK: Responders
  
  override func screenInteractionStarted(location: CGPoint) {
    // Overridden by Subclass
  }
  
  override func screenInteractionMoved(location: CGPoint) {
    // Overridden by Subclass
  }
  
  override func screenInteractionEnded(location: CGPoint) {
    // Overridden by Subclass
  }
  
  override func buttonEvent(enent: String, velocity: Float, pushedOn: Bool) {
    // Overridden by Subclass
  }
  
  override func stickEvent(event: String, point: CGPoint) {
    // Overridden by Subclass
  }
}
