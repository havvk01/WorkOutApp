//
//  TimerPercentView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 15.12.2022.
//

import UIKit

extension TimerView {
    final class PercentView: WABaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLable : UILabel = {
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRegular(witch: 23)
            lable.textColor = R.Colors.titleGray
            lable.textAlignment = .center
            
            return lable
        }()
        
        private let subtitleLable : UILabel = {
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRegular(witch: 10)
            lable.textColor = R.Colors.inActive
            
            lable.textAlignment = .center
            
            return lable
        }()
        
        override func setupViews(){
            super.setupViews()
            
            setupView(stackView)
            stackView.addArrangedSubview(percentLable)
            stackView.addArrangedSubview(subtitleLable)
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
        
        func configure(with title: String, andValue value: Int) {
            subtitleLable.text = title
            percentLable.text = "\(value)%"
        }
    }
}
