//
//  FoodDataSearchViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/24.
//

import UIKit
import CoreData

protocol foodDataSearchViewControllerDelegate: AnyObject {
    func updateUI(date: String)
}

enum foodType {
    case breakfast
    case lunch
    case dinner
    case sport
}


class FoodDataSearchViewController: UIViewController, UITableViewDataSource {
    
    let foodDataTableView = UITableView()
    let searchBar = UISearchBar()
    var foodMO: FoodManagerObject!
    var food: [FoodManagerObject] = []
    var foodFilter: [FoodManagerObject] = []
    weak var delegate: foodDataSearchViewControllerDelegate?
    var foodType: foodType!
    var isSearching = false
    var realTimeDataBaseDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(foodDataTableView)
        view.addSubview(searchBar)
        setDefaultDate()
        configureSearchBar()
        configureTableView()
//        configureCoreData()
        coreDataFetch()
//        deleteFetch()
//        saveFoodDataFromJSON()
        loadData()
    }
    
    
    func setDefaultDate() {
        let Date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let currentDate = formatter.string(from: Date)
        if realTimeDataBaseDate == "" {
            realTimeDataBaseDate = currentDate
        }
    }
    
    
    func loadData() {
        foodFilter = food
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodFilter.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as! FoodDataCell
        let foodItem = foodFilter[indexPath.item]
        cell.foodNameLabel.text = foodItem.foodName
        cell.foodkcalLabel.text = "\(String(Int(round(foodItem.foodKcal))))Kcal"
        return cell
    }
    
    
    func configureSearchBar() {
        searchBar.placeholder = "請輸入想找尋的食物"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            searchBar.widthAnchor.constraint(equalToConstant: view.width),
            searchBar.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    
    func configureTableView() {
        foodDataTableView.register(FoodDataCell.self, forCellReuseIdentifier: "food")
        foodDataTableView.tableHeaderView = searchBar
        foodDataTableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        foodDataTableView.scrollIndicatorInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        foodDataTableView.rowHeight = 100
        foodDataTableView.dataSource = self
        foodDataTableView.delegate  = self
        foodDataTableView.frame = view.bounds
//        foodDataTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            foodDataTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: <#T##CGFloat#>),
//            foodDataTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            foodDataTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            foodDataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
    
    
    func configureCoreData(foodName: String, foodKcal: Float) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            foodMO = FoodManagerObject(context: appDelegate.persistentContainer.viewContext)
            foodMO.foodName = foodName
            foodMO.foodKcal = foodKcal
            print("存入coreData")
            appDelegate.saveContext()
        }
    }
    
    
    func coreDataFetch() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let request: NSFetchRequest<FoodManagerObject> = FoodManagerObject.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            do {
                food =  try context.fetch(request)
                for i in food {
//                    print("食物名稱\(i.foodName)食物熱量\(i.foodKcal)")
                }
                
            } catch {
                print(error)
            }
        }
    }
    
    
    func deleteFetch() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let request: NSFetchRequest<FoodManagerObject> = FoodManagerObject.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            let predicate = NSPredicate(format: "foodName == %@ AND foodKcal == %d", "漢堡", 325)
            request.predicate = predicate
            
            do {
                let food = try context.fetch(request)
                
                if let foodToDelete = food.first {
                    
                    context.delete(foodToDelete)
                    try appDelegate.saveContext()
                } else {
                    print("沒有找到符合的物件")
                }
            } catch {
                print(error)
            }
        }
    }
    
    
    func saveFoodDataFromJSON() {
        if let url = Bundle.main.url(forResource: "foodData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let foodData = try decoder.decode([FoodJSON].self, from: data)
                for food in foodData {
                    print("食物名稱:\(food.foodName)食物熱量:\(food.foodKcal)")
                    configureCoreData(foodName: food.foodName, foodKcal: food.foodKcal)
                }
            } catch {
                print("JSON失敗")
            }
        } else {
            print("找不到JSON檔")
        }
    }
}


extension FoodDataSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            foodFilter = food
        } else {
            let foodItem = food.filter { foodItem in
                if let name = foodItem.foodName {
                    return name.lowercased().contains(searchText.lowercased())
                } else {
                   return false
                }
            }
            foodFilter = foodItem
            isSearching = true
        }
        foodDataTableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        foodDataTableView.contentInset = UIEdgeInsets.zero
        searchBar.resignFirstResponder()
        foodFilter = food
        isSearching = false
        foodDataTableView.reloadData()
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        foodDataTableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        searchBar.resignFirstResponder()
        return true
    }
}


extension FoodDataSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activeArray = isSearching ? foodFilter : food
        let food = activeArray[indexPath.item]
        
        if foodType == .breakfast {
            RealtimeDatabaseManager.shared.updateKcal(email: "godjj@gmail.com", date: realTimeDataBaseDate, Kcal: Int(round(food.foodKcal)), foodType: .breakfast)
            delegate?.updateUI(date: realTimeDataBaseDate)
        } else if foodType == .lunch {
            RealtimeDatabaseManager.shared.updateKcal(email: "godjj@gmail.com", date: realTimeDataBaseDate, Kcal: Int(round(food.foodKcal)), foodType: .lunch)
            delegate?.updateUI(date: realTimeDataBaseDate)
        } else if foodType == .dinner {
            RealtimeDatabaseManager.shared.updateKcal(email: "godjj@gmail.com", date: realTimeDataBaseDate, Kcal: Int(round(food.foodKcal)), foodType: .dinner)
            delegate?.updateUI(date: realTimeDataBaseDate)
        }
        dismiss(animated: true)
    }
}

