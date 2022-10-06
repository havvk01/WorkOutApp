//
//  WeekdayView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 06.10.2022.
//

import UIKit

extension WeekView {
    
    final class WeekdayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isTooday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isTooday ? Resourses.Colors.active : Resourses.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isTooday ? .white : Resourses.Colors.inActive
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isTooday ? .white : Resourses.Colors.inActive
        }
    }
}

extension WeekView.WeekdayView {
    override func addViews() {
        super.addViews()

        addView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
    override func configureView() {
        super.configureView()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resourses.Fonts.helveticaRegular(witch: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resourses.Fonts.helveticaRegular(witch: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
