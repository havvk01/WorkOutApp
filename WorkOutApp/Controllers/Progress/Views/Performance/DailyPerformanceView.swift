//
//  performanceView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 22.12.2022.
//

import UIKit
final class DailyPerformanceView: WABaseInfoView {
    
    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }

}

extension DailyPerformanceView {
    override func setupViews() {
        super.setupViews()
        
        setupView(barsView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
    }
    
}

