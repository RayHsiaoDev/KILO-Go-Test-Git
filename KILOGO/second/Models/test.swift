//
//  test.swift
//  test
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit

class test: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "上面bar")
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
