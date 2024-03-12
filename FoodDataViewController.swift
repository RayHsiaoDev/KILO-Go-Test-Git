//
//  FoodDataViewController.swift
//  FoodDataViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
 let screenWidth = UIScreen.main.bounds.size.width
 let screenHeight = UIScreen.main.bounds.size.height

class FoodDataViewController: UIViewController, BreakfirstViewControllerDelegate {

    let waterWave = WaterModel()
    var dataPicker = UIDatePicker()
    
    static let top = UIImage(named: "上面bar")
    let topView = UIImageView(image: top)
    
    static let mid = UIImage(named: "中間圖層")
    let midView = UIImageView(image: mid)
//    let midView1 = UIImageView(image: mid)
//    let midView2 = UIImageView(image: mid)
    
    static let midPeople = UIImage(named: "人")
    let midPeopleView = UIImageView(image: midPeople)
    
    static let midCircle1 = UIImage(named: "中間bar1")
    let midCircle1View = UIImageView(image: midCircle1)
    
    static let midCircle2 = UIImage(named: "中間bar2")
    let midCircle2View = UIImageView(image: midCircle2)
    
    static let midCircle3 = UIImage(named: "中間bar3")
    let midCircle3View = UIImageView(image: midCircle3)
    
    let data: UILabel = {
        let data = UILabel()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        let date = NSDate()
        data.text = formatter.string(from: date as Date)
        data.textAlignment = .center
        data.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        data.backgroundColor = #colorLiteral(red: 1, green: 0.7630042434, blue: 0.3796334863, alpha: 1)
        data.layer.cornerRadius = 15
        data.clipsToBounds = true
        data.isUserInteractionEnabled = true
        return data
    }()
    
    let text1: UILabel = {
        let data = UILabel()
        data.textAlignment = .center
//        data.font = .systemFont(ofSize: 14)
        data.font = UIFont.boldSystemFont(ofSize: 13)
        data.text = "1300\n攝取卡路里"
        data.numberOfLines = 2
        data.textColor = .black
        data.backgroundColor = .clear
        return data
    }()
    
    let text2: UILabel = {
        let data = UILabel()
        data.textAlignment = .center
//        data.font = .systemFont(ofSize: 14)
        data.font = UIFont.boldSystemFont(ofSize: 13)
        data.text = "100\n消耗卡路里"
        data.numberOfLines = 2
        data.textColor = .black
        data.backgroundColor = .clear
        return data
    }()
    
    let text3: UILabel = {
        let data = UILabel()
        data.textAlignment = .center
//        data.font = .systemFont(ofSize: 14)
        data.font = UIFont.boldSystemFont(ofSize: 13)
        data.text = "1200\n總共卡路里"
        data.numberOfLines = 2
        data.textColor = .black
        data.backgroundColor = .clear
        return data
    }()
    
    let foodButton: UIButton = {
        let food = UIButton()
        food.setTitle("飲食", for: .normal)
        food.setTitleColor(.black, for: .normal)
//        food.backgroundColor = .red
        return food
    }()
    
    let sportButton: UIButton = {
        let sport = UIButton()
        sport.setTitle("運動", for: .normal)
        sport.setTitleColor(.black, for: .normal)
//        sport.backgroundColor = .blue
        return sport
    }()
    
    let underline1: UILabel = {
        let underline = UILabel()
        underline.backgroundColor = .gray
        underline.layer.cornerRadius = 2
        underline.clipsToBounds = true
        return underline
    }()
    
    let underline2: UILabel = {
        let underline = UILabel()
        underline.backgroundColor = .gray
        underline.layer.cornerRadius = 2
        underline.clipsToBounds = true
        return underline
    }()
    
    let breakButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "早餐"), for: .normal)
        return button
    }()
    
    let lunchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "午餐"), for: .normal)
        return button
    }()
    
    let dinnerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "晚餐"), for: .normal)
        return button
    }()
    
    let elseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "其他"), for: .normal)
        return button
    }()
    
    let sport1Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "運動"), for: .normal)
        return button
    }()
    
    let search1Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "放大鏡"), for: .normal)
        return button
    }()
    
    let search2Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "放大鏡"), for: .normal)
        return button
    }()
    
    let search3Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "放大鏡"), for: .normal)
        return button
    }()
    
    let search4Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "放大鏡"), for: .normal)
        return button
    }()
    
    let search5Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "放大鏡"), for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.alpha = 0.4
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        view.backgroundColor = .white
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dataPressed))
        
        let dataFrame = CGRect(x: 73, y: view.top + 100, width: view.width-146, height: 30)

        data.addGestureRecognizer(tap)
        
        data.frame = dataFrame
        
        topView.frame = CGRect(x: -5, y: 0, width: view.width+10, height: 80)
        
        midView.frame = CGRect(x: 25 , y: data.bottom + 23, width: view.width-50, height: 400)
//        midView1.frame = CGRect(x: 25 , y: data.bottom + 23, width: view.width-50, height: 400)
//        midView2.frame = CGRect(x: 25 , y: data.bottom + 23, width: view.width-50, height: 400)
        
        midPeopleView.frame = CGRect(x: midView.left+133, y: midView.top+20, width: midView.width-266, height: 300)
        
        midCircle1View.frame = CGRect(x: midView.left+10, y: midPeopleView.bottom+30, width: midView.width/3-15, height: 40)
        
        
        midCircle2View.frame = CGRect(x: midCircle1View.right+12, y: midPeopleView.bottom+30, width: midView.width/3-15, height: 40)
        
        midCircle3View.frame = CGRect(x: midCircle2View.right+12, y: midPeopleView.bottom+30, width: midView.width/3-15, height: 40)
        
        text1.frame = CGRect(x: midCircle1View.left+15, y: midCircle1View.top-2, width: 80, height: 44)
        
        text2.frame = CGRect(x: midCircle2View.left+15, y: midCircle2View.top-2, width: 80, height: 44)
        
        text3.frame = CGRect(x: midCircle3View.left+15, y: midCircle3View.top-2, width: 80, height: 44)
        
        foodButton.frame = CGRect(x: 30, y: midView.bottom+10, width: view.width/2-20, height: 30)
        
        sportButton.frame = CGRect(x: foodButton.right, y: midView.bottom+10, width: view.width/2-50, height: 30)
        
        underline1.frame = CGRect(x: 70, y: foodButton.bottom, width:view.width/2-100, height: 3)
        
        underline2.frame = CGRect(x: foodButton.right+25, y: sportButton.bottom, width:view.width/2-100, height: 3)
        
        breakButton.frame = CGRect(x: 50, y: underline1.bottom+20, width:view.width/2-60, height: 90)
        
        lunchButton.frame = CGRect(x: breakButton.right+25, y: underline2.bottom+20, width:view.width/2-60, height: 90)
        
        dinnerButton.frame = CGRect(x: 50, y: breakButton.bottom+25, width:view.width/2-60, height: 90)
        
        elseButton.frame = CGRect(x: dinnerButton.right+25, y: lunchButton.bottom+25, width:view.width/2-60, height: 90)
        
        sport1Button.frame = CGRect(x: 50, y: underline1.bottom+20, width:view.width/2-60, height: 90)
        
        search1Button.frame = CGRect(x: breakButton.right-37, y: breakButton.bottom-35, width:30, height: 30)
        
        search2Button.frame = CGRect(x: lunchButton.right-37, y: lunchButton.bottom-35, width:30, height: 30)
        
        search3Button.frame = CGRect(x: dinnerButton.right-37, y: dinnerButton.bottom-35, width:30, height: 30)
        
        search4Button.frame = CGRect(x: elseButton.right-37, y: elseButton.bottom-35, width:30, height: 30)
        
        search5Button.frame = CGRect(x: sport1Button.right-37, y: sport1Button.bottom-35, width:30, height: 30)
        label.frame = view.bounds
        sportButton.addTarget(self, action: #selector(sport), for: .touchUpInside )
        foodButton.addTarget(self, action: #selector(food), for: .touchUpInside)
        breakButton.addTarget(self, action: #selector(breakbutton), for: .touchUpInside)
        lunchButton.addTarget(self, action: #selector(lunchbutton), for: .touchUpInside)
        dinnerButton.addTarget(self, action: #selector(dinnerbutton), for: .touchUpInside)
        elseButton.addTarget(self, action: #selector(otherbutton), for: .touchUpInside)
        sport1Button.addTarget(self, action: #selector(sportbutton), for: .touchUpInside)
        
        search1Button.addTarget(self, action: #selector(didsearch1), for: .touchUpInside)
        
        sport1Button.isHidden = true
        search5Button.isHidden = true
        underline2.isHidden = true
        view.addSubview(waterWave)
        view.addSubview(data)
        view.addSubview(topView)
        view.addSubview(midView)
//        view.addSubview(midView1)
//        view.addSubview(midView2)
//        view.addSubview(midPeopleView)
        view.addSubview(midCircle1View)
        view.addSubview(midCircle2View)
        view.addSubview(midCircle3View)
        view.addSubview(text1)
        view.addSubview(text2)
        view.addSubview(text3)
        view.addSubview(foodButton)
        view.addSubview(sportButton)
        view.addSubview(underline1)
        view.addSubview(underline2)
        view.addSubview(breakButton)
        view.addSubview(lunchButton)
        view.addSubview(dinnerButton)
        view.addSubview(elseButton)
        view.addSubview(sport1Button)
        view.addSubview(search1Button)
        view.addSubview(search2Button)
        view.addSubview(search3Button)
        view.addSubview(search4Button)
        view.addSubview(search5Button)
        view.addSubview(label)
        waterWave.progress = 0
        waterWave.setUpProgress(waterWave.progress)
        NSLayoutConstraint.activate([
            waterWave.heightAnchor.constraint(equalToConstant: midView.height/2+50),
            waterWave.leftAnchor.constraint(equalTo: midView.leftAnchor, constant: 0),
            waterWave.rightAnchor.constraint(equalTo: midView.rightAnchor, constant: 0),
            waterWave.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -30)
            
        ])
    }
    
    func breakfirstViewController(bool: Bool) {
        label.isHidden = bool
    }
    
    @objc func didsearch1() {
        let vc = BreakfirstViewController()
        vc.delegate = self
        addChild(vc)
        vc.didMove(toParent: self)
        view.addSubview(vc.view)
        let frame: CGRect = CGRect(x: 0, y: view.height, width: view.width, height: view.height*0.5)
        vc.view.frame = frame
        label.isHidden = false
        UIView.animate(withDuration: 0.8) {
            vc.view.frame = CGRect(x: 0, y: self.view.height-frame.height, width: frame.width, height: frame.height)
        }
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
    
        @objc func dataPressed(sender: UIButton){
        
        let dataAlert = UIAlertController(title: "\n\n\n\n", message: "", preferredStyle: .alert)
            
            dataAlert.view.translatesAutoresizingMaskIntoConstraints = false
        
            let height = NSLayoutConstraint(item: dataAlert.view,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .height,
                                             multiplier: 1.0,
                            constant: view.frame.height * 0.4 + 10 ).isActive = true

            
            // Filtering width constraints of alert base view width
            let widthConstraints = dataAlert.view.constraints.filter({ return $0.firstAttribute == .width })
            
            dataAlert.view.removeConstraints(widthConstraints)
            
            // Here you can enter any width that you want
            let newWidth = UIScreen.main.bounds.width * 0.90
            
            // Adding constraint for alert base view
            let widthConstraint = NSLayoutConstraint(item: dataAlert.view,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: newWidth)
            
            
            dataAlert.view.addConstraint(widthConstraint)
            
            let firstContainer = dataAlert.view.subviews[0]
            
            // Finding first child width constraint
            let constraint = firstContainer.constraints.filter({ return $0.firstAttribute == .width && $0.secondItem == nil })
            
            firstContainer.removeConstraints(constraint)
            
            // And replacing with new constraint equal to alert.view width constraint that we setup earlier
            dataAlert.view.addConstraint(NSLayoutConstraint(item: firstContainer,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: dataAlert.view,
                                                            attribute: .width,
                                                            multiplier: 1.0,
                                                            constant: 0))
            
            // Same for the second child with width constraint with 998 priority
            let innerBackground = firstContainer.subviews[0]
            
            let innerConstraints = innerBackground.constraints.filter({ return $0.firstAttribute == .width && $0.secondItem == nil })
            
            innerBackground.removeConstraints(innerConstraints)
            
            firstContainer.addConstraint(NSLayoutConstraint(item: innerBackground,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: firstContainer,
                                                            attribute: .width,
                                                            multiplier: 1.0,
                                                            constant: 0))
            
            present(dataAlert, animated: true, completion: nil)
        
            
       
                    
            let done = UIAlertAction(title: "確定", style: .default, handler: nil)
            
            dataAlert.addAction(done)
                
            dataAlert.view.addSubview(dataPicker)
            
            dataPicker.translatesAutoresizingMaskIntoConstraints = false
            
            dataPicker.locale = Locale(identifier: "zh_CN")
            
            dataPicker.date = NSDate() as Date
            
            dataPicker.datePickerMode = .date
            
            dataPicker.preferredDatePickerStyle = .inline
            
            
            
            let pickerLeading = NSLayoutConstraint(item: dataPicker,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: dataAlert.view,
                                                 attribute: .leading,
                                                   multiplier: 1.0,
                                                 constant: 10).isActive = true
            
            let pickerTrailing = NSLayoutConstraint(item: dataPicker,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: dataAlert.view,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: -10).isActive = true
            
            let pickerTop = NSLayoutConstraint(item: dataPicker,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: dataAlert.view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 5).isActive = true
            
            let pickerHeight = NSLayoutConstraint(item: dataPicker,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: dataAlert.view,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: -25).isActive = true
            
            dataPicker.addTarget(self, action: #selector(datachanged), for: .valueChanged)
            
    }
    
    @objc func datachanged(datepicker: UIDatePicker){
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy年MM月dd日"

        data.text = formatter.string(from: dataPicker.date)
        
    }
    
    @objc func sport(sender: UIButton) {
        
        underline2.isHidden = false
        underline1.isHidden = true
        sport1Button.isHidden = false
        search5Button.isHidden = false
        breakButton.isHidden = true
        lunchButton.isHidden = true
        dinnerButton.isHidden = true
        elseButton.isHidden = true
        search1Button.isHidden = true
        search2Button.isHidden = true
        search3Button.isHidden = true
        search4Button.isHidden = true
        
    }
    
    @objc func food(sender: UIButton) {
        
        underline1.isHidden = false
        underline2.isHidden = true
        sport1Button.isHidden = true
        search5Button.isHidden = true
        breakButton.isHidden = false
        lunchButton.isHidden = false
        dinnerButton.isHidden = false
        elseButton.isHidden = false
        search1Button.isHidden = false
        search2Button.isHidden = false
        search3Button.isHidden = false
        search4Button.isHidden = false
        
    }
  
}



