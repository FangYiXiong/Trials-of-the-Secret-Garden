import SpriteKit
import GameplayKit

class GamePlayMode: SGScene{
  //MARK: Instance Variables
  
  //Initial Data
  var characterIndex = 0
  var levelIndex = 0
  
  //Generators
  
  //Layers
  var worldLayer:TileLayer!
  var backgroundLayer:SKNode!
  var overlayGUI:SKNode!
  
  //State Machine
  lazy var stateMachine: GKStateMachine = GKStateMachine(states: [
    GameSceneInitialState(scene: self),
    GameSceneActiveState(scene: self),
    GameScenePausedState(scene: self),
    GameSceneVictorySeqState(scene: self),
    GameSceneWinState(scene: self),
    GameSceneLoseState(scene: self)
    ])
  
  //ECS
  var entities = Set<GKEntity>()
  
  //Component systems
  lazy var componentSystems: [GKComponentSystem] =  {
    let parallaxSystem = GKComponentSystem(componentClass: ParallaxComponent.self)
    let animationSystem = GKComponentSystem(componentClass: AnimationComponent.self)
    return [animationSystem, parallaxSystem]
  }()
  
  //Timers
  var lastUpdateTimeInterval: NSTimeInterval = 0
  let maximumUpdateDeltaTime: NSTimeInterval = 1.0 / 60.0
  var lastDeltaTime: NSTimeInterval = 0
  
  // Controls
  
  //MARK: Initializer
  
  override func didMoveToView(view: SKView) {
    stateMachine.enterState(GameSceneInitialState.self)
  }
  
  //MARK: Functions
  func addEntity(entity: GKEntity,toLayer layer:SKNode) {
    //Add Entity to set
    entities.insert(entity)
    
    //Add Sprites to Scene
    if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
      layer.addChild(spriteNode)
    }
    
    //Add Components to System
    for componentSystem in self.componentSystems {
      componentSystem.addComponentWithEntity(entity)
    }
  
  }
  
  //MARK: Life Cycle
  
  override func update(currentTime: CFTimeInterval) {
      //Calculate delta time
      var deltaTime = currentTime - lastUpdateTimeInterval
      deltaTime = deltaTime > maximumUpdateDeltaTime ?
        maximumUpdateDeltaTime : deltaTime
      lastUpdateTimeInterval = currentTime
      
      //Update game
      for componentSystem in componentSystems {
        componentSystem.updateWithDeltaTime(deltaTime)
      }
  }
}