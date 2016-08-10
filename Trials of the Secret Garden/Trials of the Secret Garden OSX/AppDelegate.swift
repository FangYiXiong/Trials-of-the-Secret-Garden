
import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var window: NSWindow!
  @IBOutlet weak var skView: SKView!
  
  func applicationDidFinishLaunching(aNotification: NSNotification) {
    
    let resWidth = GameSettings.Defaults.OSX_Resolutions[GameSettings.Defaults.OSX_DefaultResolution].0
    let resHeight = GameSettings.Defaults.OSX_Resolutions[GameSettings.Defaults.OSX_DefaultResolution].1
    
    let scene = GameScene(size: CGSize(width: resWidth, height: resHeight))
    scene.scaleMode = .AspectFit
    
    _ = SGResolution(screenSize: skView.bounds.size, canvasSize: scene.size)
    
    self.skView!.presentScene(scene)
    
    self.skView!.ignoresSiblingOrder = true
    
    #if DEBUG
      skView!.showsFPS = GameSettings.Debugging.ALL_ShowFrameRate
      skView!.showsNodeCount = GameSettings.Debugging.ALL_ShowNodeCount
    #endif
    
    if (GameSettings.Defaults.OSX_Start_FullScreen) {
      window.toggleFullScreen(nil)
    }
  }
  
  func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
    return true
  }
}
