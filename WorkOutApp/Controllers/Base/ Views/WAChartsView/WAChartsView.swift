//
//  WABArsView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 21.12.2022.
//

import UIKit

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class WAChartsView: WABaseView {
     
    func configure(with data: [WAChartsView.Data]) {
        

    }
}


extension WAChartsView {
    override func setupViews() {
        super.setupViews()
        
//        setupView(stackView)
    }
        
    override func constaintViews() {
        super.constaintViews()
        
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
//
//        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        backgroundColor = .clear
    }
}
