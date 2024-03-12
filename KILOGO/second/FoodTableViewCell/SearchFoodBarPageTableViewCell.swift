//
//  SearchBarPageTableViewCell.swift
//  SearchBarPageTableViewCell
//
//  Created by 陳韋綸 on 2021/8/17.
//

import UIKit

class SearchFoodBarPageTableViewCell: UITableViewCell {

    static let identerfier = "SearchFoodBarPageTableViewCell"
    
    private let uiview: UIView = {
       return UIView()
    }()
    
    private let foodName: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(25)
        label.textColor = .black
        return label
    }()
    
    private let foodKCal: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .black
        return label
    }()
    
    private let foodWeight: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        addSubview(uiview)
        uiview.addSubview(foodName)
        uiview.addSubview(foodKCal)
        uiview.addSubview(foodWeight)
    }
    
    public func configure(FoodName: String) {
        foodName.text = FoodName
    }
    
    public func configure(FoodKCal: String) {
        foodKCal.text = FoodKCal + "大卡"
    }
    
    public func configure(FoodWeight: String) {
        foodWeight.text = FoodWeight
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        uiview.frame = contentView.bounds
        foodName.frame = CGRect(x: 20, y: 10, width: 300, height: 50)
        foodKCal.frame = CGRect(x: 20, y: foodName.bottom, width: 300, height: 30)
        foodWeight.frame = CGRect(x: right-100, y: 25, width: 300, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
