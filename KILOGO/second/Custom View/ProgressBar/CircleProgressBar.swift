//
//  CircleProgressBar.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/12.
//

import UIKit

class CircleProgressBar: UIView {
    
    var progressLayer = CAShapeLayer()
    var progressBackgroundMask = CAShapeLayer()
    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay()}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureProgressBar()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureProgressBar() {
        layer.addSublayer(progressBackgroundMask)
        layer.addSublayer(progressLayer)
        self.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0.55, alpha: 1)
        layer.mask = progressBackgroundMask
    }
    
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath(arcCenter: rect.origin, radius: rect.height/2, startAngle: .pi * 1/2, endAngle: 0, clockwise: false).cgPath
        progressBackgroundMask.path = path
        progressBackgroundMask.strokeColor = UIColor.red.cgColor
        progressBackgroundMask.fillColor = nil
        progressBackgroundMask.lineWidth = 32
        
        progressLayer.path = path
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 32
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = UIColor(red: 1, green: 0.6, blue: 0.3, alpha: 1).cgColor
        progressLayer.fillColor = nil
        
    }
}
