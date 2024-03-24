//
//  FoodDataSearchViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/24.
//

import UIKit
import CoreData

class FoodDataSearchViewController: UIViewController, UITableViewDataSource {
    
    let foodDataTableView = UITableView()
    var foodMO: FoodManagerObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(foodDataTableView)
        configureTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as! FoodDataCell
        
        return cell
    }
    
    func configureTableView() {
        foodDataTableView.register(FoodDataCell.self, forCellReuseIdentifier: "food")
        foodDataTableView.rowHeight = 100
        foodDataTableView.dataSource = self
        foodDataTableView.frame = view.bounds
//        foodDataTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            foodDataTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            foodDataTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            foodDataTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            foodDataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
    
    
    func configureCoreData() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            
        }
    }
    
}
