//
//  KcalProgressBar.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/8.
//

import UIKit

class KcalProgressBar: UIView {
    
    var progressline = CALayer()
    var testGit = UIImageView()
    var progressBar = CAShapeLayer()
    
    var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }
    
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureProgressBar()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureProgressBar() {
        layer.addSublayer(progressline)
    }
    

    override func draw(_ rect: CGRect) {
        progressBar.path = UIBezierPath(roundedRect: rect, cornerRadius: 25).cgPath
        layer.mask = progressBar
        layer.cornerRadius = rect.height/2
        layer.masksToBounds = true
        
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressline.frame = progressRect
        progressline.backgroundColor = color.cgColor
    }
    
}
