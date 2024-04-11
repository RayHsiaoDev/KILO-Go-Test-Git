//
//  HeaderView.swift
//  HeaderView
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit

class HeaderView: UIView {

    private let view1 = UIView()
    private let view2 = UIView()
    private let view3 = UIView()
    private let pillar1: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.8784313798, green: 0.8784313798, blue: 0.8784313798, alpha: 1)
        label.layer.masksToBounds = true
         return label
    }()
    private let pillar2: UIImageView = {
        let image = UIImageView()
         image.backgroundColor = .orange
         return image
    }()
    
    private let image1: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "能量")
        return image
    }()
    private let label1: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "RANK"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private let image2: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "能量")
        return image
    }()
    private let label2: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "2,000"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private let image3: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "能量")
        return image
    }()
    private let label3: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "2,000"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(view1)
        addSubview(view2)
        addSubview(view3)
        addSubview(pillar1)
        addSubview(pillar2)
        view1.addSubview(image1)
        view1.addSubview(label1)
        view2.addSubview(image2)
        view2.addSubview(label2)
        view3.addSubview(image3)
        view3.addSubview(label3)
        configureUI()
    }
    
    func configureUI() {
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view2.center = CGPoint(x: center.x+5, y: height/2+height/4)
        view2.frame.size = CGSize(width: 100, height: height/2)
        view1.frame = CGRect(x: view2.left-120, y: height/2, width: 100, height: height/2)
        view3.frame = CGRect(x: view2.right+20, y: height/2, width: 100, height: height/2)

        image1.frame = CGRect(x: 0, y: 5, width: view1.height-10, height: view1.height-10)
        label1.frame = CGRect(x: view1.width/2, y: 0, width: view1.width/2, height: view1.height)
        
        image2.frame = CGRect(x: 0, y: 5, width: view2.height-10, height: view2.height-10)
        label2.frame = CGRect(x: view2.width/2, y: 0, width: view2.width/2, height: view2.height)

        image3.frame = CGRect(x: 0, y: 5, width: view3.height-10, height: view3.height-10)
        label3.frame = CGRect(x: view3.width/2, y: 0, width: view3.width/2, height: view3.height)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
