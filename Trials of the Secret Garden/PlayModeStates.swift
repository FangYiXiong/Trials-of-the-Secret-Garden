
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
    gs.camera?.setScale(0.44)
    
    //Layers
    gs.worldLayer = TileLayer(levelIndex: gs.levelIndex, typeIndex: .setMain)
    gs.addChild(gs.worldLayer)
    gs.backgroundLayer = SKNode()
    myCamera.addChild(gs.backgroundLayer)
    
    //Initial Entities
    let background01 = BackgroundEntity(movementFactor: CGPoint(x: -20.0, y: 0.0), image: SKTexture(imageNamed: "BG001") , size: SKMSceneSize!, position:CGPointZero, reset: true)
    background01.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground01
    gs.addEntity(background01, toLayer:gs.backgroundLayer)
    let background02 = BackgroundEntity(movementFactor: CGPoint(x: -20.0, y: 0.0), image: SKTexture(imageNamed: "BG001") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
    background02.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground01
    gs.addEntity(background02, toLayer:gs.backgroundLayer)
    let background03 = BackgroundEntity(movementFactor: CGPoint(x: -40.0, y: 0.0), image: SKTexture(imageNamed: "BG002") , size: SKMSceneSize!, position:CGPointZero, reset: true)
    background03.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground02
    gs.addEntity(background03, toLayer:gs.backgroundLayer)
    let background04 = BackgroundEntity(movementFactor: CGPoint(x: -40.0, y: 0.0), image: SKTexture(imageNamed: "BG002") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
    background04.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground02
    gs.addEntity(background04, toLayer:gs.backgroundLayer)
    let background05 = BackgroundEntity(movementFactor: CGPoint(x: -90.0, y: 0.0), image: SKTexture(imageNamed: "BG003") , size: SKMSceneSize!, position:CGPointZero, reset: true)
    background05.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground03
    gs.addEntity(background05, toLayer:gs.backgroundLayer)
    let background06 = BackgroundEntity(movementFactor: CGPoint(x: -90.00, y: 0.0), image: SKTexture(imageNamed: "BG003") , size: SKMSceneSize!, position:CGPoint(x: SKMSceneSize!.width, y: 0), reset: true)
    background06.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zBackground03
    gs.addEntity(background06, toLayer:gs.backgroundLayer)

    let characters = ["Male","Female"]
    let atlas = SKTextureAtlas(named: characters[gs.characterIndex])
    
    if let playerPlaceholder = gs.worldLayer.childNodeWithName("placeholder_StartPoint") {
      let player = PlayerEntity(position: playerPlaceholder.position, size: CGSize(width: 25.4, height: 48.0), firstFrame: atlas.textureNamed("Idle__000"), atlas: atlas)
      player.spriteComponent.node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
      player.spriteComponent.node.zPosition = GameSettings.GameParams.zValues.zPlayer
      player.animationComponent.requestedAnimationState = .Run
      gs.centerCameraOnPoint(playerPlaceholder.position)
      gs.addEntity(player, toLayer: gs.worldLayer)
    } else {
      fatalError("[Play Mode: No placeholder for player!")
    }
    
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