//
//  SeachFoodKCalPageViewController.swift
//  SeachFoodKCalPageViewController
//
//  Created by 陳韋綸 on 2021/8/17.
//

import UIKit
import Firebase

struct FoodData {
    let foodName: String
    let foodKCal: String
    let foodWeight: String
    let handler: (() -> Void)
    let category: FoodType
}

enum FoodType: String {
    case Eggs = "蛋類"
    case meat = "肉類"
    case fruit = "蔬果類"
    case drinks = "飲料類"
}


class FoodSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var foodData = [FoodData]()
    private var seachFood = [FoodData]()

    var data = [String]()
    var filteredData = [String]()
    var filtered = false
    
    var DateTime = String()
    var ChooseTime = String()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "請輸入食物"
        search.backgroundColor = .secondarySystemBackground
        return search
    }()
    
    private let foodTabelView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(didTabBackToRecordKacl))
        
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["全部","蛋類","肉類","蔬果類","飲料類"]
        
        foodTabelView.rowHeight = 100
        foodTabelView.register(SearchFoodBarPageTableViewCell.self, forCellReuseIdentifier: SearchFoodBarPageTableViewCell.identerfier)
        foodTabelView.delegate = self
        foodTabelView.dataSource = self
        
        view.addSubview(searchBar)
        view.addSubview(foodTabelView)
        setupData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        foodTabelView.frame = CGRect(x: 0, y: searchBar.bottom, width: view.width, height: view.height-searchBar.bottom)
    }
    
    @objc private func didTabBackToRecordKacl() {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            seachFood = foodData
            foodTabelView.reloadData()
            return
        }
        
        seachFood = foodData.filter({ food -> Bool in
            food.foodName.contains(searchText)
        })
        searchBar.selectedScopeButtonIndex = 0
        
        foodTabelView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            seachFood = foodData
        case 1:
            seachFood = foodData.filter({ food -> Bool in
                food.category == FoodType.Eggs
            })
        case 2:
            seachFood = foodData.filter({ food -> Bool in
                food.category == FoodType.meat
            })
        case 3:
            seachFood = foodData.filter({ food -> Bool in
                food.category == FoodType.fruit
            })
        case 4:
            seachFood = foodData.filter({ food -> Bool in
                food.category == FoodType.drinks
            })
        default:
            break
        }
        foodTabelView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    private func setupData() {
        foodData.append(
            FoodData(foodName: "雞蛋", foodKCal: "132", foodWeight: "蛋類", handler: {}, category: .Eggs)
        )
        foodData.append(
            FoodData(foodName: "牛肉", foodKCal: "731", foodWeight: "肉類", handler: {}, category: .meat)
        )
        foodData.append(
            FoodData(foodName: "豬肉", foodKCal: "839", foodWeight: "肉類", handler: {}, category: .meat)
        )
        foodData.append(
            FoodData(foodName: "雞肉", foodKCal: "678", foodWeight: "肉類", handler: {}, category: .meat)
        )
        foodData.append(
            FoodData(foodName: "蘋果", foodKCal: "70", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "香蕉", foodKCal: "113", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "鳳梨", foodKCal: "177", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "高麗菜", foodKCal: "67", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "地瓜葉", foodKCal: "88", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "馬鈴薯", foodKCal: "577", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "鳥蛋", foodKCal: "78", foodWeight: "蛋類", handler: {}, category: .Eggs)
        )
        foodData.append(
            FoodData(foodName: "羊肉", foodKCal: "723", foodWeight: "肉類", handler: {}, category: .meat)
        )
        foodData.append(
            FoodData(foodName: "西瓜", foodKCal: "211", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "葡萄", foodKCal: "98", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "花椰菜", foodKCal: "91"+"大卡", foodWeight: "蔬果類", handler: {}, category: .fruit)
        )
        foodData.append(
            FoodData(foodName: "可樂", foodKCal: "367", foodWeight: "飲料類", handler: {}, category: .drinks)
        )
        foodData.append(
            FoodData(foodName: "奶茶", foodKCal: "459", foodWeight: "飲料類", handler: {}, category: .drinks)
        )
        foodData.append(
            FoodData(foodName: "水", foodKCal: "0", foodWeight: "飲料類", handler: {}, category: .drinks)
        )
        // 17
        seachFood = foodData
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seachFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchFoodBarPageTableViewCell.identerfier, for: indexPath) as! SearchFoodBarPageTableViewCell

        cell.configure(FoodName: seachFood[indexPath.row].foodName)
        cell.configure(FoodKCal: seachFood[indexPath.row].foodKCal)
        cell.configure(FoodWeight: seachFood[indexPath.row].foodWeight)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchBar.resignFirstResponder()
        
        let FoodName = seachFood[indexPath.row].foodName
        let FoodKCal = seachFood[indexPath.row].foodKCal
        
        guard let email = UserDefaults.standard.string(forKey: "email") else {return}
        if ChooseTime == "breakfirst" {
            Database.database().reference(withPath: "ID/\(email)/Profile/DayFood/\(DateTime)/Breakfirst/\(FoodName)").setValue(FoodKCal)
        } else if ChooseTime == "lunch" {
                Database.database().reference(withPath: "ID/\(email)/Profile/DayFood/\(DateTime)/Lunch/\(FoodName)").setValue(FoodKCal)
            } else if ChooseTime == "dinner" {
                Database.database().reference(withPath: "ID/\(email)/Profile/DayFood/\(DateTime)/Dinner/\(FoodName)").setValue(FoodKCal)
            }
        dismiss(animated: true, completion: nil)
        
        let model = seachFood[indexPath.row].handler
        model()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

