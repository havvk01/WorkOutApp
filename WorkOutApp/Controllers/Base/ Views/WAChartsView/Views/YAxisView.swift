//
//  YAxisView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 21.12.2022.
//

import UIKit

final class YAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach {
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRegular(witch: 9)
            lable.textColor = R.Colors.inActive
            lable.textAlignment = .right
            lable.text = "\($0 * 10)"
        }
    }
    
}


extension YAxisView {
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
