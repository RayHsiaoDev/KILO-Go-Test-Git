//
//  ChooseMainPageMainInfo.swift
//  ChooseMainPageMainInfo
//
//  Created by 陳韋綸 on 2021/12/7.
//

import UIKit

class ChooseMainPageMainInfo: UIView {

    enum LabelType {
        case bear
        case girl
        case boy
    }
    
    private let type: LabelType
    
    private let mainInformationTitle: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let mainInformationLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    init(type: LabelType) {
        self.type = type
        super.init(frame: .zero)
        addSubview(mainInformationTitle)
        addSubview(mainInformationLabel)
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        layer.cornerRadius = 20
        alpha = 0
        if type == .bear {
            mainInformationTitle.text = "熊太郎"
            mainInformationLabel.text = "『熊熊火焰章魚燒』的老闆。小熊從前只是一隻生活在野外的熊，但後來有一天被魔法族的老大發現後，魔法師就下了讓小熊變成一隻會魔法也會說話的一隻熊，決定把牠帶回去培養，訓練成魔法族的護衛來保護魔法族。但之後因為訓練實在是太嚴苛了，所以小熊中途就逃了出來，並被一家賣章魚燒店的師父所救。之後便決定跟隨這個師傅學習做章魚燒。許多年過去，小熊已經變成能獨當一面的章魚燒師傅，憑藉著火焰能力的魔法，再加上自己愛吃蜂蜜而研發的特製蜂蜜醬汁，『熊熊火焰章魚燒』馬上就變成美食國人民最愛的食物。"
        }
        else if type == .girl {
            mainInformationTitle.text = "山下"
            mainInformationLabel.text = ""
        }
        else if type == .boy {
            mainInformationTitle.text = "智障"
            mainInformationLabel.text = ""
        }
    }
    
    override func layoutSubviews() {
        mainInformationTitle.frame = CGRect(x: 0, y: 30, width: width, height: 30)
        mainInformationLabel.frame = CGRect(x: 25, y: mainInformationTitle.bottom, width: width-40, height: height-50)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
