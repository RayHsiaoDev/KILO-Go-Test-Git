//
//  DataPickerViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/20.
//

import UIKit

protocol DataPickerViewControllerDelegate: AnyObject {
    func userDidChooseDate(date: String)
}

class DataPickerViewController: UIViewController {
    
    let containerView = DataPickerContainerView()
    let dataPicker = UIDatePicker()
    let confirmButton = UIButton()
    weak var delegate: DataPickerViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubview(containerView)
        containerView.addSubview(dataPicker)
        containerView.addSubview(confirmButton)
        configureContainerView()
        configureDataPicker()
        configureConfirmButton()
    }
    
    func configureContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 370),
            containerView.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    
    func configureDataPicker() {
        dataPicker.preferredDatePickerStyle = .inline
        dataPicker.datePickerMode = .date
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataPicker.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dataPicker.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            dataPicker.widthAnchor.constraint(equalToConstant: 350),
            dataPicker.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    func configureConfirmButton() {
        confirmButton.setTitle("確認", for: .normal)
        confirmButton.backgroundColor = .red
        confirmButton.layer.cornerRadius = 16
        confirmButton.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: dataPicker.bottomAnchor, constant: 7),
            confirmButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 320),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
//    var dataClosure: ((String) -> Void)?
    
    @objc func dissmissVC() {
        let dataPickerDate = dataPicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        let date = formatter.string(from: dataPickerDate)
        guard date != nil else { return }
        
//        dataClosure?(date)
        delegate.userDidChooseDate(date: date)
        print("他選擇的日期是\(date)")
        dismiss(animated: true)
    }
}
