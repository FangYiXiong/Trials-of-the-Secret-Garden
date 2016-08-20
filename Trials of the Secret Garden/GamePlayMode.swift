import SpriteKit
import GameplayKit

class GamePlayMode: SGScene{
  //MARK: Instance Variables
  
  //Initial Data
  var characterIndex = 0
  var levelIndex = 0
  
  //Generators
  
  //Layers
  
  //State Machine
  
  //ECS
  
  //Component systems
  
  //Timers
  var lastUpdateTimeInterval: NSTimeInterval = 0
  let maximumUpdateDeltaTime: NSTimeInterval = 1.0 / 60.0
  var lastDeltaTime: NSTimeInterval = 0
  
  // Controls
  
  //MARK: Life Cycle
  
  override func update(currentTime: CFTimeInterval) {
      //Calculate delta time
      var deltaTime = currentTime - lastUpdateTimeInterval
      deltaTime = deltaTime > maximumUpdateDeltaTime ?
        maximumUpdateDeltaTime : deltaTime
      lastUpdateTimeInterval = currentTime
      
      //Update game
  }
}