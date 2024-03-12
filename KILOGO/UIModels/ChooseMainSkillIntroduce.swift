//
//  ChooseMainSkillIntroduce.swift
//  ChooseMainSkillIntroduce
//
//  Created by 陳韋綸 on 2021/12/6.
//

import UIKit

class ChooseMainSkillIntroduce: UIView {
    
    enum skillLabelType {
        case bearAttack
        case bearHealth
        case bearKiller
    }

    private let type: skillLabelType
    
    private let label1: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .brown
        return label
    }()
    
    private let label2: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        return label
    }()
    
    private let label3: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    init(type: skillLabelType) {
        self.type = type
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label1.frame = CGRect(x: 20, y: 10, width: width, height: 30)
        label2.frame = CGRect(x: 20, y: label1.bottom+10, width: width, height: 30)
        label3.frame = CGRect(x: 20, y: label2.bottom+10, width: width, height: 30)
    }
    
    private func configureUI() {
        alpha = 0
        layer.cornerRadius = 20
        if type == .bearAttack {
            label1.text = "熊熊爆火"
            label2.text = "+10 攻擊力"
            label3.text = "丟出大火球並造成對方傷害"
        }
        else if type == .bearHealth {
            label1.text = "章魚燒的庇佑"
            label2.text = "+10 回復力"
            label3.text = "吃一口章魚燒回覆生命"
        }
        else if type == .bearKiller {
            label1.text = "爆氣"
            label2.text = "+100 攻擊力"
            label3.text = "熊爆氣了"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
