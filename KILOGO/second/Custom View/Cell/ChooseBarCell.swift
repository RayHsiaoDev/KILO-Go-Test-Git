//
//  ChooseBarCell.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/18.
//

import UIKit

protocol chooseBarCellDelegate: AnyObject {
    func didTapBreakfast()
    func didTapLunch()
    func didTapDinner()
}

class ChooseBarCell: UICollectionViewCell {
    
    let breakfastButton = UIButton()
    let lunchButton = UIButton()
    let dinnerButton = UIButton()
    let elseButton = UIButton()
    let sportButton = UIButton()
    weak var delegate: chooseBarCellDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func pageOne() {
        addSubview(breakfastButton)
        addSubview(lunchButton)
        addSubview(dinnerButton)
        addSubview(elseButton)
        configureBreakfastButton()
        configureLunchButton()
        configureDinnerButton()
        configureElseButton()
    }
    
    
    func pageTwo() {
        addSubview(sportButton)
        configureSportButton()
    }
    
    
    func configureBreakfastButton() {
        breakfastButton.addTarget(self, action: #selector(didTapBreakfast), for: .touchUpInside)
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
        lunchButton.addTarget(self, action: #selector(didTapLunch), for: .touchUpInside)
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
        dinnerButton.addTarget(self, action: #selector(didTapDinner), for: .touchUpInside)
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
    
    
    func configureSportButton() {
        sportButton.addTarget(self, action: #selector(didTapSport), for: .touchUpInside)
        sportButton.setImage(UIImage(named: "運動"), for: .normal)
        sportButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sportButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            sportButton.widthAnchor.constraint(equalToConstant: 153),
            sportButton.heightAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    
    @objc func didTapBreakfast() {
        delegate.didTapBreakfast()
    }
    
    
    @objc func didTapLunch() {
        delegate.didTapLunch()
    }
    
    
    @objc func didTapDinner() {
        delegate.didTapDinner()
    }
    
    
    @objc func didTapSport() {
    
    }
}
