//
//  FoodDataViewController.swift
//  FoodDataViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
 let screenWidth = UIScreen.main.bounds.size.width
 let screenHeight = UIScreen.main.bounds.size.height

class FoodDataViewController: UIViewController, UICollectionViewDataSource {
    
    let waterWave = WaterModel()
    var dataPicker = UIDatePicker()
    let topBarImage = UIImageView()
    let dateLabel = UILabel()
    var userPickDate: String?
    let midImage = UIImageView()
    let midGetKcalImage = UIImageView()
    let midConsumeKcalImage = UIImageView()
    let midTotalKcalImage = UIImageView()
    let getKcalLabel = UILabel()
    let consumeKcalLabel = UILabel()
    let totalKcalLabel = UILabel()
    let chooseFoodButton = UIButton()
    let chooseSportButton = UIButton()
    var choosePageCollectionView: UICollectionView!
    let layout = FlowLayout()
    let chooseButtonLine = ChooseButtonLine()
    var topAnchor = NSLayoutConstraint()
    var leadingAnchor = NSLayoutConstraint()
    var widthAnchor = NSLayoutConstraint()
    var heightAnchor = NSLayoutConstraint()
    let dataPickerNew = UIDatePicker()
    var realTimeDataBaseDate = ""
    var waveHeightAnchor = NSLayoutConstraint()
    var waveLeadingAnchor = NSLayoutConstraint()
    var waveTrailingAnchor = NSLayoutConstraint()
    var waveBottomAnchor = NSLayoutConstraint()
    var currentDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(waterWave)
        view.addSubview(topBarImage)
        view.addSubview(dateLabel)
        view.addSubview(midImage)
        view.addSubview(midGetKcalImage)
        view.addSubview(midConsumeKcalImage)
        view.addSubview(midTotalKcalImage)
        view.addSubview(getKcalLabel)
        view.addSubview(consumeKcalLabel)
        view.addSubview(totalKcalLabel)
        view.addSubview(chooseFoodButton)
        view.addSubview(chooseSportButton)
        view.addSubview(chooseButtonLine)
        nowDate()
        updateVC(date: currentDate)
        configureTopBarImage()
        configureDateLabel()
        configureWaterWave()
        configureMidImage()
        configureGetKcalBar()
        configureGetKcalLabel()
        configureConsumeKcalBar()
        configureConsumeKcalLabel()
        configureTotalKcalBar()
        configureTotalKcalLabel()
        configureChooseFoodButton()
        configureChooseSportButton()
        configureCollectionView()
        configureChooseButtonLine()
    }
    
    
    func configureTopBarImage() {
        topBarImage.image = UIImage(named: "上面bar")
        
        topBarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topBarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topBarImage.widthAnchor.constraint(equalToConstant: view.width + 10),
            topBarImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureDateLabel() {
        let date = NSDate()
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        dateLabel.text = formatter.string(from: date as Date)
        dateLabel.textAlignment = .center
        dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        dateLabel.backgroundColor = #colorLiteral(red: 1, green: 0.7630042434, blue: 0.3796334863, alpha: 1)
        dateLabel.layer.cornerRadius = 15
        dateLabel.clipsToBounds = true
        dateLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(datapick))
        dateLabel.addGestureRecognizer(tap)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topBarImage.bottomAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 300),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    
    func configureWaterWave() {
        waterWave.setUpProgress(1)
        //Max heightAnchor = 340
        waveHeightAnchor = waterWave.heightAnchor.constraint(equalToConstant: 340)
        waveLeadingAnchor = waterWave.leadingAnchor.constraint(equalTo: midImage.leadingAnchor, constant: 0)
        waveTrailingAnchor =  waterWave.trailingAnchor.constraint(equalTo: midImage.trailingAnchor, constant: 0)
        waveBottomAnchor =  waterWave.bottomAnchor.constraint(equalTo: midImage.bottomAnchor, constant: -30)
        NSLayoutConstraint.activate([waveHeightAnchor, waveLeadingAnchor, waveTrailingAnchor, waveBottomAnchor])
    }
    
    
    func configureMidImage() {
        midImage.image = UIImage(named: "新中間圖層")
        midImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            midImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            midImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            midImage.widthAnchor.constraint(equalToConstant: 390),
            midImage.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    
    func configureGetKcalBar() {
        midGetKcalImage.image = UIImage(named: "中間bar1")
        midGetKcalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            midGetKcalImage.bottomAnchor.constraint(equalTo: midImage.bottomAnchor, constant: -6),
            midGetKcalImage.leadingAnchor.constraint(equalTo: midImage.leadingAnchor, constant: 15),
            midGetKcalImage.widthAnchor.constraint(equalToConstant: 110),
            midGetKcalImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureConsumeKcalBar() {
        midConsumeKcalImage.image = UIImage(named: "中間bar1")
        midConsumeKcalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            midConsumeKcalImage.bottomAnchor.constraint(equalTo: midImage.bottomAnchor, constant: -6),
            midConsumeKcalImage.leadingAnchor.constraint(equalTo: midGetKcalImage.trailingAnchor, constant: 15),
            midConsumeKcalImage.widthAnchor.constraint(equalToConstant: 110),
            midConsumeKcalImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureTotalKcalBar() {
        midTotalKcalImage.image = UIImage(named: "中間bar1")
        midTotalKcalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            midTotalKcalImage.bottomAnchor.constraint(equalTo: midImage.bottomAnchor, constant: -6),
            midTotalKcalImage.leadingAnchor.constraint(equalTo: midConsumeKcalImage.trailingAnchor, constant: 15),
            midTotalKcalImage.widthAnchor.constraint(equalToConstant: 110),
            midTotalKcalImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureGetKcalLabel() {
        getKcalLabel.textAlignment = .center
        getKcalLabel.font = UIFont.boldSystemFont(ofSize: 13)
        getKcalLabel.text = "0\n攝取卡路里"
        getKcalLabel.numberOfLines = 2
        getKcalLabel.backgroundColor = .clear
        
        getKcalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getKcalLabel.topAnchor.constraint(equalTo: midGetKcalImage.topAnchor, constant: 0),
            getKcalLabel.centerXAnchor.constraint(equalTo: midGetKcalImage.centerXAnchor),
            getKcalLabel.widthAnchor.constraint(equalToConstant: 80),
            getKcalLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureConsumeKcalLabel() {
        consumeKcalLabel.textAlignment = .center
        consumeKcalLabel.font = UIFont.boldSystemFont(ofSize: 13)
        consumeKcalLabel.text = "100\n消耗卡路里"
        consumeKcalLabel.numberOfLines = 2
        consumeKcalLabel.backgroundColor = .clear
        
        consumeKcalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumeKcalLabel.topAnchor.constraint(equalTo: midConsumeKcalImage.topAnchor, constant: 0),
            consumeKcalLabel.centerXAnchor.constraint(equalTo: midConsumeKcalImage.centerXAnchor),
            consumeKcalLabel.widthAnchor.constraint(equalToConstant: 80),
            consumeKcalLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureTotalKcalLabel() {
        totalKcalLabel.textAlignment = .center
        totalKcalLabel.font = UIFont.boldSystemFont(ofSize: 13)
        totalKcalLabel.text = "1200\n總共卡路里"
        totalKcalLabel.numberOfLines = 2
        totalKcalLabel.backgroundColor = .clear
        
        totalKcalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalKcalLabel.topAnchor.constraint(equalTo: midTotalKcalImage.topAnchor, constant: 0),
            totalKcalLabel.centerXAnchor.constraint(equalTo: midTotalKcalImage.centerXAnchor),
            totalKcalLabel.widthAnchor.constraint(equalToConstant: 80),
            totalKcalLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureChooseFoodButton() {
        chooseFoodButton.setTitle("飲食", for: .normal)
        chooseFoodButton.setTitleColor(.black, for: .normal)
        chooseFoodButton.addTarget(self, action: #selector(didtapFood), for: .touchUpInside)
        
        chooseFoodButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseFoodButton.topAnchor.constraint(equalTo: midImage.bottomAnchor, constant: 8),
            chooseFoodButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 93),
            chooseFoodButton.widthAnchor.constraint(equalToConstant: 55),
            chooseFoodButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    func configureChooseSportButton() {
        chooseSportButton.setTitle("運動", for: .normal)
        chooseSportButton.setTitleColor(.black, for: .normal)
        chooseSportButton.addTarget(self, action: #selector(didTapSport), for: .touchUpInside)
        
        chooseSportButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseSportButton.topAnchor.constraint(equalTo: midImage.bottomAnchor, constant: 8),
            chooseSportButton.leadingAnchor.constraint(equalTo: chooseFoodButton.trailingAnchor, constant: 127),
            chooseSportButton.widthAnchor.constraint(equalToConstant: 55),
            chooseSportButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    func configureChooseButtonLine() {
        chooseButtonLine.translatesAutoresizingMaskIntoConstraints = false
        topAnchor = chooseButtonLine.topAnchor.constraint(equalTo: chooseFoodButton.bottomAnchor, constant: 1)
        leadingAnchor = chooseButtonLine.leadingAnchor.constraint(equalTo: chooseFoodButton.leadingAnchor, constant: -31)
        widthAnchor = chooseButtonLine.widthAnchor.constraint(equalToConstant: 120)
        heightAnchor = chooseButtonLine.heightAnchor.constraint(equalToConstant: 2)
        NSLayoutConstraint.activate([topAnchor, leadingAnchor, widthAnchor, heightAnchor])
    }
    
    
    func chooseButtonLineAnimation(select: Int) {
        if select == 0 {
            leadingAnchor.constant = -31
        } else {
            leadingAnchor.constant = 150
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choose", for: indexPath) as! ChooseBarCell
        cell.delegate = self
        
        if indexPath.item == 0 {
            cell.pageOne()
        } else if indexPath.item == 1{
            cell.pageTwo()
        }
        
        return cell
    }
    
    
    func configureCollectionView() {
        layout.itemSize = CGSize(width: 400, height: 300)
        layout.scrollDirection = .horizontal
        
        choosePageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        choosePageCollectionView.register(ChooseBarCell.self, forCellWithReuseIdentifier: "choose")
        choosePageCollectionView.showsHorizontalScrollIndicator = false
        choosePageCollectionView.backgroundColor = .clear
        choosePageCollectionView.decelerationRate = .fast
        choosePageCollectionView.dataSource = self
        choosePageCollectionView.delegate = self
        view.addSubview(choosePageCollectionView)
        
        choosePageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            choosePageCollectionView.topAnchor.constraint(equalTo: midImage.bottomAnchor, constant: 50),
            choosePageCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choosePageCollectionView.widthAnchor.constraint(equalToConstant: 400),
            choosePageCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    func nowDate() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        currentDate = formatter.string(from: date as Date)
    }
    
    
    func updateVC(date: String) {
        RealtimeDatabaseManager.shared.getUserFoodData(email: "godjj@gmail.com", date: date) {[weak self] result in
            guard let self = self else { return }
            let breakfast = result["早餐Kcal"] as? Int ?? 0
            let lunch = result["午餐Kcal"] as? Int ?? 0
            let dinner = result["晚餐Kcal"] as? Int ?? 0
            print("早餐kcal:\(breakfast) 午餐kcal:\(lunch) 晚餐kcal:\(dinner)")
            
            let total = breakfast + lunch + dinner
            DispatchQueue.main.async {
                self.getKcalLabel.text = "\(String(total))\n攝取卡路里"
                self.waveHeightAnchor.constant = CGFloat(total)*0.18
            }
            print("更新！！\(date)的總卡路里\(total)")
        }
    }
    
    
    @objc func datapick() {
        let vc = DataPickerViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
        
        //        vc.dataClosure = { [weak self ] value in
        //            guard let self = self else { return }
        //        }
    }
    
    
    @objc func didtapFood() {
        choosePageCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        chooseButtonLineAnimation(select: 0)
    }
    
    
    @objc func didTapSport() {
        choosePageCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
        chooseButtonLineAnimation(select: 1)
    }
    
    
    @objc func breakbutton(){
        let vc = FoodSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func lunchbutton(){
        let vc = FoodSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func dinnerbutton(){
        let vc = FoodSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func otherbutton(){
        let vc = FoodSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func sportbutton(){
        let vc = FoodSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}


extension FoodDataViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let page = layout.currentPage
        print("目前是第\(page)幾頁")
        
        if decelerate {
            if page == 0 {
                chooseButtonLineAnimation(select: page)
            } else {
                chooseButtonLineAnimation(select: page)
            }
        }
    }
}


extension FoodDataViewController: DataPickerViewControllerDelegate {
    func userDidChooseDate(date: String) {
        userPickDate = date
        dateLabel.text = userPickDate
    }
    
    
    func realTimeDataBaseDate(date: String) {
        realTimeDataBaseDate = date
        print("資料庫使用日期\(date)")
    }
    
    
    func dataPickerUpdatefoodData(data: NSDictionary) {
        print("接受到dataPicker的委託嘍")
        guard let breakfast = data["早餐Kcal"] as? Int else { return }
        guard let lunch = data["午餐Kcal"] as? Int else { return }
        guard let dinner = data["晚餐Kcal"] as? Int else { return }
        print("早餐kcal:\(breakfast) 午餐kcal:\(lunch) 晚餐kcal:\(dinner)")
        let total = breakfast + lunch + dinner
        DispatchQueue.main.async {
            self.getKcalLabel.text = "\(String(total))\n攝取卡路里"
            self.waveHeightAnchor.constant = CGFloat(total)*0.18
        }
    }
}


extension FoodDataViewController: chooseBarCellDelegate {
   
    func didTapBreakfast() {
        let vc = FoodDataSearchViewController()
        vc.foodType = .breakfast
        vc.delegate = self
        vc.realTimeDataBaseDate = realTimeDataBaseDate
        present(vc, animated: true)
    }
    
    
    func didTapLunch() {
        let vc = FoodDataSearchViewController()
        vc.foodType = .lunch
        vc.delegate = self
        vc.realTimeDataBaseDate = realTimeDataBaseDate
        present(vc, animated: true)
    }
    
    
    func didTapDinner() {
        let vc = FoodDataSearchViewController()
        vc.foodType = .dinner
        vc.delegate = self
        vc.realTimeDataBaseDate = realTimeDataBaseDate
        present(vc, animated: true)
    }

}


extension FoodDataViewController: foodDataSearchViewControllerDelegate {
    func updateUI(date: String) {
        updateVC(date: date)
        print("最終接收到的時間是\(date)")
    }
}
