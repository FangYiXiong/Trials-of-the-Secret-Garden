
import Foundation
import SpriteKit
import GameplayKit

enum toolSelection {
    case toolMove
    case toolAdd
    case toolRemove
}

class GameBuildMode: SGScene {
    
    //Layers
    var worldLayer: TileLayer!
    var overlayLayer = SKNode()
    
    //Tools
    var currentTool = toolSelection.toolMove
    var tilePanel = builderPanel(images: tileImages)
    
    //Tiles
    static let tileImages = [
        "0","1","2","3","4","5","6","7","8","9",
        "10","11","12","13","14","15","16","17",
        "18","B3","Sign_1","Sign_2",
        "Crate","gem","Mushroom_1","Mushroom_2"
    ]
    
    override func didMoveToView(view: SKView) {
        
        //Setup camera
        let myCamera = SKCameraNode()
        camera = myCamera
        addChild(myCamera)
        
        //Setup Layers
        worldLayer = TileLayer(levelIndex: 0, typeIndex: .setBuilder)
        addChild(worldLayer)
        myCamera.addChild(overlayLayer)
        
        //UI Elements
        let modeButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        modeButton.posByScreen(-0.4, y: 0.4)
        modeButton.fontSize = 40
        modeButton.text = lt("Move")
        modeButton.fontColor = SKColor.whiteColor()
        modeButton.zPosition = 150
        modeButton.name = "modeSelect"
        overlayLayer.addChild(modeButton)
        
        let zoButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        zoButton.posByScreen(-0.4, y: -0.45)
        zoButton.fontSize = 30
        zoButton.text = lt("Zoom Out")
        zoButton.fontColor = SKColor.whiteColor()
        zoButton.zPosition = 150
        zoButton.name = "zoomOut"
        overlayLayer.addChild(zoButton)
        
        let ziButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        ziButton.posByScreen(-0.2, y: -0.45)
        ziButton.fontSize = 30
        ziButton.text = lt("Zoom In")
        ziButton.fontColor = SKColor.whiteColor()
        ziButton.zPosition = 150
        ziButton.name = "zoomIn"
        overlayLayer.addChild(ziButton)
        
        let upButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        upButton.posByScreen(0.35, y: 0.45)
        upButton.fontSize = 30
        upButton.text = lt("Up")
        upButton.fontColor = SKColor.whiteColor()
        upButton.zPosition = 150
        upButton.name = "Up"
        overlayLayer.addChild(upButton)
        
        let downButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        downButton.posByScreen(0.35, y: -0.45)
        downButton.fontSize = 30
        downButton.text = lt("Down")
        downButton.fontColor = SKColor.whiteColor()
        downButton.zPosition = 150
        downButton.name = "Down"
        overlayLayer.addChild(downButton)
        
        let printButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        printButton.posByScreen(0.0, y: -0.45)
        printButton.fontSize = 30
        printButton.text = lt("Print")
        printButton.fontColor = SKColor.whiteColor()
        printButton.zPosition = 150
        printButton.name = "Print"
        overlayLayer.addChild(printButton)
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.position = CGPointZero
        background.xScale = 1.2
        background.yScale = 1.2
        background.alpha = 0.2
        background.zPosition = -1
        overlayLayer.addChild(background)
        
        tilePanel.posByScreen(0.45, y: 0.45)
        tilePanel.selectIndex(0)
        overlayLayer.addChild(tilePanel)
        
    }
    
    
}

//Tile Panel

class builderPanel: SKNode {
    
    let atlasTiles = SKTextureAtlas(named: "Tiles")
    var selectedIndex = 0
    
    init(images:[String]) {
        super.init()
        
        for (index, imageString) in images.enumerate() {
            let node = SKSpriteNode(texture: atlasTiles.textureNamed(imageString))
            node.size = CGSize(width: 32, height: 32)
            node.position = CGPoint(x: 0, y: index * -34)
            node.alpha = 0.5
            node.zPosition = 150
            node.name = "T_\(index)"
            node.userData = ["index":index]
            addChild(node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectIndex(indexSelected:Int) {
        selectedIndex = indexSelected
        
        for child in children {
            if selectedIndex == (child.userData!["index"] as? Int)! {
                child.alpha = 1.0
                child.setScale(1.1)
            } else {
                child.alpha = 0.5
                child.setScale(1.0)
            }
        }
    }
    
}
