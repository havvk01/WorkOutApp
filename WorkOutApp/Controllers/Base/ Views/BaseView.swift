//
//  BaseView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 04.10.2022.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        constaintViews()
        configureApperance()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


@objc extension BaseView {
    func setupViews() { }
    
    func constaintViews() {}
    
    func configureApperance() {
        backgroundColor = .white
    }
}
