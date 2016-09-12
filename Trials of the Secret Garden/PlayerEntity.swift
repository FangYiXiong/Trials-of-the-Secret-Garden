

import SpriteKit
import GameplayKit

class PlayerEntity: GKEntity {
  var spriteComponent: SpriteComponent!
  var animationComponent: AnimationComponent!
  
  init(position: CGPoint, size: CGSize, firstFrame:SKTexture, atlas: SKTextureAtlas) {
    super.init()
    
    //Initialize components
    spriteComponent = SpriteComponent(entity: self, texture: SKTexture(), size: size, position: position)
    addComponent(spriteComponent)
    animationComponent = AnimationComponent(node: spriteComponent.node, textureSize: size, animations: loadAnimations(atlas))
    addComponent(animationComponent)
  }
  
  func loadAnimations(textureAtlas:SKTextureAtlas) -> [AnimationState: Animation] {
    var animations = [AnimationState: Animation]()
    
    animations[.Jump] = AnimationComponent.animationFromAtlas(textureAtlas,withImageIdentifier:AnimationState.Jump.rawValue,forAnimationState: .Jump, repeatTexturesForever: false)
    animations[.Run] = AnimationComponent.animationFromAtlas(textureAtlas,withImageIdentifier:AnimationState.Run.rawValue,forAnimationState: .Run, repeatTexturesForever: true)
    animations[.IdleThrow] = AnimationComponent.animationFromAtlas(textureAtlas,withImageIdentifier: AnimationState.IdleThrow.rawValue,forAnimationState: .IdleThrow, repeatTexturesForever: false)
    
    return animations
  }

  
}
