//
//  StatsView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 19.12.2022.
//

import UIKit

final class StatsView: WABaseInfoView {
    
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
 //       view.backgroundColor = .red
        return view
    }()
    
    func configure(with items: [StatsItem]) {
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
    
//    override func setupViews() {
//        super.setupViews()
//
//
//        setupView(itemView)
//        itemView.configure(with: StatItemView.StatsItem(image: R.Images.Stats.heartRate, value: "155 bpm", title: R.Strings.Session.heartRate.uppercased()))
//
//        NSLayoutConstraint.activate([
//            itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
//
//        ])
//    }
}

extension StatsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
    }
    
}
