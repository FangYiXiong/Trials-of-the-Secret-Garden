
import SpriteKit

class TileLayer: SKNode, tileMapDelegate {
  
  var levelGenerator = tileMapBuilder()
  
  init(levelIndex:Int, typeIndex:setType) {
    super.init()
    
    levelGenerator.delegate = self
    
    levelGenerator.loadLevel(levelIndex, fromSet: typeIndex)
    levelGenerator.presentLayerViaDelegate()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: tileMapDelegate
  
  func createNodeOf(type type:tileType, location:CGPoint) {
    //Load texture atlas
    let atlasTiles = SKTextureAtlas(named: "Tiles")
    
    //Handle each object
    switch type {
    case .tileAir:
      //Intentionally left blank
      break
    case .tileGroundLeft:
      break
    case .tileGround:
      let node = SKSpriteNode(texture: atlasTiles.textureNamed("2"))
      node.size = CGSize(width: 32, height: 32)
      node.position = location
      node.zPosition = GameSettings.GameParams.zValues.zWorld
      addChild(node)
      break
    case .tileGroundRight:
      
         break
    case .tileWallLeft:
       break
    case .tileGroundMiddle:
        break
    case .tileWallRight:
         break
    case .tileGroundCornerR:
        break
    case .tileGroundCornerRU:
      break
    case .tileCeiling:
       break
    case .tileGroundCornerLU:
      break
    case .tileGroundCornerL:
       break
    case .tileCeilingLeft:
       break
    case .tilePlatformLeft:
      break
    case .tilePlatform:
        break
    case .tilePlatformRight:
      break
    case .tileCeilingRight:
      break
    case .tileWaterSurface:
       break
    case .tileWater:
       break
    case .tileRandomScenery:
       break
    case .tileSignPost:
      break
    case .tileSignArrow:
      break
    case .tileCrate:
      break
    case .tileGem:
      break
    case .tileStartLevel:
      break
    case .tileEndLevel:
      break
    }
    
    
  }

}
