//
//  WaterModel.swift
//  UIWater
//
//  Created by 蕭煜勳 on 2021/11/9.
//

import UIKit

class WaterModel: UIView {
    
    private let firstLayer = CAShapeLayer()
    private let secondLayer = CAShapeLayer()
    
    private var firstColor: UIColor = .clear
    private var secondColor: UIColor = .clear

    private let two: CGFloat = .pi*2
    private var offset: CGFloat = 0.0
    
    public let widths = screenWidth*0.1
    public let heights = screenHeight*0.1
    var showSingleWave = false
    private var start = false
    
    var waveHeight: CGFloat = 30.0

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension WaterModel {
    
    func setUpViews() {
        bounds = CGRect(x: 0.0, y: 0.0, width: min(width, width), height: min(width, width))
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
//        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        
        waveHeight = 10.0
        
        firstColor = #colorLiteral(red: 1, green: 0.5727596283, blue: 0.1528507173, alpha: 1).withAlphaComponent(0.8)
        secondColor = #colorLiteral(red: 1, green: 0.5727596283, blue: 0.1528507173, alpha: 1).withAlphaComponent(0.4)
        
        createFirstLayer()
        
        if !showSingleWave {
            createSecondLayer()
        }
    }
    
    private func createFirstLayer() {
        firstLayer.frame = bounds
        firstLayer.anchorPoint = .zero
        firstLayer.fillColor = firstColor.cgColor
        layer.addSublayer(firstLayer)
    }
    
    private func createSecondLayer() {
        secondLayer.frame = bounds
        secondLayer.anchorPoint = .zero
        secondLayer.fillColor = secondColor.cgColor
        layer.addSublayer(secondLayer)
    }
    
    func setUpProgress(_ pr: CGFloat) {
        let top: CGFloat = pr*bounds.size.height
        firstLayer.setValue(height-top, forKeyPath: "position.y")
        secondLayer.setValue(height-top, forKeyPath: "position.y")
        
        if !start {
            DispatchQueue.main.async {
                self.starAnime()
            }
        }
    }
    
    private func starAnime() {
        start = true
        waterWaveAnime()
    }
    
    private func waterWaveAnime() {
        let w = bounds.size.width
        let h = bounds.size.height
        
        let bezier = UIBezierPath()
        let path = CGMutablePath()
        
        let starOffsetY = waveHeight*CGFloat(sinf(Float(offset*two/w)))
        
        var originOffsetY: CGFloat = 0.0
        path.move(to: CGPoint(x: 0, y: starOffsetY), transform: .identity)
        bezier.move(to: CGPoint(x: 0.0, y: starOffsetY))
        
        for i in stride(from: 0.0, to: w*1000, by: 1) {
            originOffsetY = waveHeight*CGFloat(sinf(Float(two/w*i+offset*two/w)))
            bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
        }
        
        bezier.addLine(to: CGPoint(x: w*1000, y: originOffsetY))
        bezier.addLine(to: CGPoint(x: w*1000, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: starOffsetY))
        bezier.close()
        
        let anim = CABasicAnimation(keyPath: "transform.translation.x")
        anim.duration = 2.0
        anim.fromValue = -w*0.5
        anim.toValue = -w-w+0.5
        anim.repeatCount = .infinity
        anim.isRemovedOnCompletion = false
        
        firstLayer.fillColor = firstColor.cgColor
        firstLayer.path = bezier.cgPath
        firstLayer.add(anim, forKey: nil)
        
        if !showSingleWave {
            let bezier = UIBezierPath()

            let starOffsetY = waveHeight*CGFloat(sinf(Float(offset*two/w)))
            
            var originOffsetY: CGFloat = 0.0
           
            bezier.move(to: CGPoint(x: 0.0, y: starOffsetY))
            
            for i in stride(from: 0.0, to: w*1000, by: 1) {
                originOffsetY = waveHeight*CGFloat(cosf(Float(two/w*i+offset*two/w)))
                bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
            }
            
            bezier.addLine(to: CGPoint(x: w*1000, y: originOffsetY))
            bezier.addLine(to: CGPoint(x: w*1000, y: h))
            bezier.addLine(to: CGPoint(x: 0.0, y: h))
            bezier.addLine(to: CGPoint(x: 0.0, y: starOffsetY))
            bezier.close()
            
            secondLayer.fillColor = secondColor.cgColor
            secondLayer.path = bezier.cgPath
            secondLayer.add(anim, forKey: nil)
        }
    }
}
