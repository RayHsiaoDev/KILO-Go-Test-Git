//
//  BreakfirstViewController.swift
//  BreakfirstViewController
//
//  Created by 陳韋綸 on 2021/12/21.
//

import UIKit
protocol BreakfirstViewControllerDelegate: AnyObject {
    func breakfirstViewController(bool: Bool)
}
class BreakfirstViewController: UIViewController {

    weak var delegate: BreakfirstViewControllerDelegate?
    
    let titles: UILabel = {
       let label = UILabel()
        label.text = "早餐"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 0.7805024981, blue: 0.3923495412, alpha: 1)
        return label
    }()
    
    let titles1: UILabel = {
       let label = UILabel()
        label.text = " 薯餅蛋餅                                200Cal"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.5225084424, blue: 0, alpha: 1)
        return label
    }()
    
    let titles2: UILabel = {
       let label = UILabel()
        label.text = " 奶茶                                          100Cal"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 1, green: 0.5225084424, blue: 0, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 40
        view.addSubview(titles)
        view.addSubview(titles1)
        view.addSubview(titles2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titles.frame = CGRect(x: 0, y: 50, width: view.width, height: 80)
        titles1.frame = CGRect(x: 20, y: titles.bottom+20, width: view.width-40, height: 60)
        titles2.frame = CGRect(x: 20, y: titles1.bottom+20, width: view.width-40, height: 60)
        titles1.layer.cornerRadius = titles1.height/2
        titles2.layer.cornerRadius = titles2.height/2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let viewcontroller = self
        let frame = viewcontroller.view.frame
        UIView.animate(withDuration: 0.2) {
            viewcontroller.view.frame = CGRect(x: 0, y: self.view.height, width: frame.width, height: frame.height)
        } completion: { [weak self] done in
            if done {
                DispatchQueue.main.async {
                    // remove comment vc as child
                    viewcontroller.view.removeFromSuperview()
                    viewcontroller.removeFromParent()
                    self?.delegate?.breakfirstViewController(bool: true)
                    // allow horizontal and vertical scroll

                }
            }
        }
    }
}
