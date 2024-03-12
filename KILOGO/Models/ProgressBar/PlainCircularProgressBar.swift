//
//  PlainCircularProgressBar.swift
//  ProgrssBars
//
//  Created by Marina on 09/05/2020.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PlainCircularProgressBar: UIView {
    var color: UIColor? = .gray {
        didSet { setNeedsDisplay() }
    }
    var ringWidth: CGFloat = 35

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    private var progressLayer = CAShapeLayer()
    private var backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        backgroundMask.lineWidth = ringWidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor(red: 1, green: 0.8, blue: 0.55, alpha: 1).cgColor
        layer.mask = backgroundMask

        progressLayer.lineWidth = ringWidth
        progressLayer.fillColor = nil
        layer.addSublayer(backgroundMask)
        layer.addSublayer(progressLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, 1)
    }

    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: rect.origin, radius: rect.width/2-10, startAngle: 0, endAngle: -.pi/2, clockwise: false)
        backgroundMask.path = circlePath.cgPath

        progressLayer.path = circlePath.cgPath
        progressLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = color?.cgColor
    }
}
