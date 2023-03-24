//
//  XAxisView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 19.03.2023.
//

import UIKit

final class XAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRegular(witch: 9)
            lable.textColor = R.Colors.inActive
            lable.text = $0.title.uppercased() // TODO: - Remake to colculated interval
            
            stackView.addArrangedSubview(lable)
        }
    }
    
}


extension XAxisView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)

    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        backgroundColor = .clear
    }
}
