//
//  ProgressBarNode.swift
//  ProgressBarNode
//
//  Created by 陳韋綸 on 2021/8/5.
//

import Foundation
import SpriteKit

class ProgressBarNode: SKNode {
    var borderNode: SKSpriteNode
    var barNode: SKSpriteNode
    var width: Int!
    
    init(width: Int) {
        self.width = width
        self.borderNode = SKSpriteNode(color: .white, size: .init(width: width, height: 50))
        self.barNode = SKSpriteNode(color: .red, size: .init(width: width, height: 50))
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       
        self.borderNode = SKSpriteNode(color: .white, size: .init(width: width, height: 50))
        self.barNode = SKSpriteNode(color: .red, size: .init(width: width, height: 50))
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addChild(borderNode)
        addChild(barNode)

//        barNode.zPosition = 5
        barNode.anchorPoint = .init(x: 0, y: 0.5)
        barNode.position.x = -(barNode.size.width/2)
        
    }
    
    /// Amount goes 0 -1
    public func updataProgress(_ amount: CGFloat) {
        let correctAmount = min(max(0, amount), 1)
        barNode.run(.scaleX(to: correctAmount, duration: 1))
    }
}
