//
//  FoodDataCell.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/24.
//

import UIKit

class FoodDataCell: UITableViewCell {
    
    var foodNameLabel = UILabel()
    var foodkcalLabel = UILabel()
    var foodTypeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(foodNameLabel)
        addSubview(foodkcalLabel)
        addSubview(foodTypeLabel)
        configureFoodNameLabel()
        configureFoodKcalLabel()
//        configureFoodTypeLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureFoodNameLabel() {
        foodNameLabel.textAlignment = .center
        foodNameLabel.font = UIFont.systemFont(ofSize: 30)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            foodNameLabel.widthAnchor.constraint(equalToConstant: 150),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    func configureFoodKcalLabel() {
        foodkcalLabel.textAlignment = .center
        foodkcalLabel.font = UIFont.systemFont(ofSize: 25)
        foodkcalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodkcalLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodkcalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-45),
            foodkcalLabel.widthAnchor.constraint(equalToConstant: 100),
            foodkcalLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    
    func configureFoodTypeLabel() {
        foodTypeLabel.text = "食物"
        foodTypeLabel.textAlignment = .center
        foodTypeLabel.font = UIFont.systemFont(ofSize: 13)
        foodTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodTypeLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 1),
            foodTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            foodTypeLabel.widthAnchor.constraint(equalToConstant: 80),
            foodTypeLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
