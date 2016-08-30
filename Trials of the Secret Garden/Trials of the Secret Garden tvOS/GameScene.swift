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
    // Start Background Music
//    SKTAudio.sharedInstance().playBackgroundMusic("background_music.mp3")
//    SKTAudio.sharedInstance().backgroundMusicPlayer?.volume = 0.4
    
    // Transition to Main Menu
    let nextScene = MainMenu(size: self.scene!.size)
    nextScene.scaleMode = self.scaleMode
    self.view?.presentScene(nextScene)
    
  }
}
