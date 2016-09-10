
import SpriteKit
import GameplayKit

class BackgroundEntity: GKEntity {
  
  var spriteComponent: SpriteComponent!

  init(movementFactor: CGPoint, image: SKTexture, size: CGSize, position: CGPoint, reset: Bool) {
    super.init()
    
    spriteComponent = SpriteComponent(entity: self, texture: image, size: size, position: position)
    addComponent(spriteComponent)
    let parallaxComponent = ParallaxComponent(entity: self, movementFactor: movementFactor, spritePosition: spriteComponent.node.position, reset: reset)
    addComponent(parallaxComponent)
  }
}
