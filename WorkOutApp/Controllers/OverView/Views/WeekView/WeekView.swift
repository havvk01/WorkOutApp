//
//  WeekView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 06.10.2022.
//

import UIKit

final class WeekView: WABaseView {
    
    private let calendar = Calendar.current
    private let stackView = UIStackView()
}

extension WeekView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
        
        weekdays.enumerated().forEach { index, name in
            let view = WeekdayView()
            //configure(with index: Int, and name: String)
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
