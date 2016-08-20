
import Foundation
import GameplayKit
import SpriteKit

class GameSceneState: GKState {
  unowned let gs: GamePlayMode
  init(scene: GamePlayMode) {
    self.gs = scene
  }
}

class GameSceneInitialState: GameSceneState {
  override func didEnterWithPreviousState(previousState: GKState?) {
    
    //Delegates
    
    //Camera
    let myCamera = SKCameraNode()
    gs.camera = myCamera
    gs.addChild(myCamera)
    
    //Layers
    gs.worldLayer = TileLayer(levelIndex: gs.levelIndex, typeIndex: .setMain)
    gs.addChild(gs.worldLayer)
    
  }
  
  override func willExitWithNextState(nextState: GKState) {
    
  }
}
class GameSceneActiveState: GameSceneState {
  
}
class GameScenePausedState: GameSceneState {
  
}
class GameSceneVictorySeqState: GameSceneState {
  
}
class GameSceneWinState: GameSceneState {
  
}
class GameSceneLoseState: GameSceneState {
  
}