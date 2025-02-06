import SwiftUI
import SpriteKit

class CharacterScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8) // Default gravity
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // Boundaries to keep characters inside
    }
    
    func addCharacter(named: String, at position: CGPoint) {
        let sprite = SKSpriteNode(imageNamed: "orangeguy")
        print("created!")
        sprite.position = position
        sprite.size = CGSize(width: 100, height: 100) // Adjust as needed
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.physicsBody?.restitution = 0.2 // Bounciness
        sprite.name = "character"
        
        addChild(sprite)
    }
    
    func removeCharacter(at point: CGPoint) {
        let nodesAtPoint = nodes(at: point)
        for node in nodesAtPoint {
            if node.name == "character" {
                node.removeFromParent() // Remove the character
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            removeCharacter(at: location)
        }
    }
}
