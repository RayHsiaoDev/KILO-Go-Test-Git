//
//  ChooseButtonLine.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/18.
//

import UIKit

class ChooseButtonLine: UIView {
    
    let path = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        path.move(to: CGPoint(x: 1, y: 1))
        path.addLine(to: CGPoint(x: 50, y: 1))
        path.lineWidth = 5
        UIColor.black.setStroke()
        path.stroke()
    }
}
