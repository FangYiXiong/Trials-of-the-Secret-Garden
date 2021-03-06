
import Foundation
import CoreGraphics
import SpriteKit

///GLOBAL POINTERS
var gameTextures: Array<SKTextureAtlas>?
var gameSounds: Array<SKAction>?

enum AnimationState: String {
  case Idle = "Idle_"
  case Dead = "Dead_"
  case Jump = "Jump_"
  case JumpThrow = "Jump_Throw_"
  case Run = "Run_"
  case Slide = "Slide_"
  case IdleThrow = "Throw_"
}

struct GameSettings {
  
  /**
   Standard options when game is run in debug mode.
   */
  
  struct Debugging {
    
    static let ALL_ShowFrameRate: Bool = true
    static let ALL_ShowNodeCount: Bool = true
    
    static let IOS_ShowDrawCount: Bool = false
    static let IOS_ShowQuadCount: Bool = false
    static let IOS_ShowPhysics  : Bool = false
    static let IOS_ShowFields   : Bool = false
    
    static let ALL_TellMeStatus : Bool = true
  }
  
  /**
   Standard options for the game in all modes.
   */
  
  struct Defaults {
    
    static let ALL_Identifier         : String = "com.northysoftware.example"
    
    static let OSX_Start_FullScreen   : Bool = false
    static let OSX_DefaultResolution  : Int  = 0
    
    static let OSX_Resolutions        : [(CGFloat, CGFloat)] = [(1024, 768), (1280, 800)]
    static let ALL_Introduce          : Bool = false
    
    static let ALL_MenuSelectColor    : SKColor = SKColorWithRGB(255, g: 255, b: 0)
    static let ALL_MenuNormalColor    : SKColor = SKColorWithRGB(255, g: 255, b: 255)
    
  }
  
  /**
   Game standards in all modes.
   */
  
  struct GameParams {
    
    /* Enter your static parameters here */
    
    struct zValues {
      static let zBackground01:CGFloat = 10
      static let zBackground02:CGFloat = 20
      static let zBackground03:CGFloat = 30
      static let zWorld:CGFloat = 100.0
      
      static let zWorldFront: CGFloat = 150.0
      static let zPlayer: CGFloat = 125.0
    }
    
  }
  
}