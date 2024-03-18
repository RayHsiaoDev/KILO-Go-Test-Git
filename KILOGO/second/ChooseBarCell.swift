//
//  ChooseBarCell.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/18.
//

import UIKit

class ChooseBarCell: UICollectionViewCell {
    
    let breakfastButton = UIButton()
    let lunchButton = UIButton()
    let dinnerButton = UIButton()
    let elseButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(breakfastButton)
        addSubview(lunchButton)
        addSubview(dinnerButton)
        addSubview(elseButton)
        configureBreakfastButton()
        configureLunchButton()
        configureDinnerButton()
        configureElseButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureBreakfastButton() {
        breakfastButton.setImage(UIImage(named: "早餐"), for: .normal)
        breakfastButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breakfastButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            breakfastButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            breakfastButton.widthAnchor.constraint(equalToConstant: 153),
            breakfastButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
    func configureLunchButton() {
        lunchButton.setImage(UIImage(named: "午餐"), for: .normal)
        lunchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lunchButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            lunchButton.leadingAnchor.constraint(equalTo: breakfastButton.trailingAnchor, constant: 30),
            lunchButton.widthAnchor.constraint(equalToConstant: 153),
            lunchButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
    func configureDinnerButton() {
        dinnerButton.setImage(UIImage(named: "晚餐"), for: .normal)
        dinnerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dinnerButton.topAnchor.constraint(equalTo: breakfastButton.bottomAnchor, constant: 30),
            dinnerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            dinnerButton.widthAnchor.constraint(equalToConstant: 153),
            dinnerButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
    func configureElseButton() {
        elseButton.setImage(UIImage(named: "其他"), for: .normal)
        elseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            elseButton.topAnchor.constraint(equalTo: lunchButton.bottomAnchor, constant: 30),
            elseButton.leadingAnchor.constraint(equalTo: dinnerButton.trailingAnchor, constant: 35),
            elseButton.widthAnchor.constraint(equalToConstant: 153),
            elseButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
}
