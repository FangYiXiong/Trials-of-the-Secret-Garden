/*
* Copyright (c) 2015 Neil North.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Foundation
import SpriteKit

extension SGScene {
  
  /**
  Handle screen click events.
  */
  
  override func mouseDown(theEvent: NSEvent) {
    
    let location = theEvent.locationInNode(self)
    screenInteractionStarted(location)
    
  }
  
  override func mouseDragged(theEvent: NSEvent) {
    
    let location = theEvent.locationInNode(self)
    screenInteractionMoved(location)
  }
  
  override func mouseUp(theEvent: NSEvent) {
    
    let location = theEvent.locationInNode(self)
    screenInteractionEnded(location)
    
  }
  
  override func mouseExited(theEvent: NSEvent) {
    
    let location = theEvent.locationInNode(self)
    screenInteractionEnded(location)
    
  }
  
  /**
  Handle key presses and depresses.
  */
  
  override func keyDown(theEvent: NSEvent) {
    handleKeyEvent(theEvent, keyDown: true)
  }
  
  override func keyUp(theEvent: NSEvent) {
    handleKeyEvent(theEvent, keyDown: false)
  }
  
  func handleKeyEvent(event: NSEvent, keyDown: Bool) {
    guard let characters = event.charactersIgnoringModifiers?.characters else {
      return
    }
    for character in characters {
      buttonEvent("\(character)", velocity: 1.0, pushedOn: keyDown)
    }
  }
  
}