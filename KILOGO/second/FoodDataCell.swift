//
//  FoodDataCell.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/24.
//

import UIKit

class FoodDataCell: UITableViewCell {
    
    let foodNameLabel = UILabel()
    let foodkcalLabel = UILabel()
    let foodTypeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(foodNameLabel)
        addSubview(foodkcalLabel)
        addSubview(foodTypeLabel)
        configureFoodNameLabel()
        configureFoodKcalLabel()
        configureFoodTypeLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureFoodNameLabel() {
        foodNameLabel.text = "漢堡"
        foodNameLabel.textAlignment = .center
        foodNameLabel.font = UIFont.systemFont(ofSize: 28)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            foodNameLabel.widthAnchor.constraint(equalToConstant:   80),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureFoodKcalLabel() {
        foodkcalLabel.text = "345"
        foodkcalLabel.textAlignment = .center
        foodkcalLabel.font = UIFont.systemFont(ofSize: 15)
        foodkcalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodkcalLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 2),
            foodkcalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            foodkcalLabel.widthAnchor.constraint(equalToConstant: 80),
            foodkcalLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureFoodTypeLabel() {
        foodTypeLabel.text = "肉類"
        foodTypeLabel.textAlignment = .center
        foodTypeLabel.font = UIFont.systemFont(ofSize: 45)
        foodTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-20),
            foodTypeLabel.widthAnchor.constraint(equalToConstant: 100),
            foodTypeLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
