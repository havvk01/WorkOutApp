//
//  OverviewNavBar.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 04.10.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel = UILabel()
    private let allWorkOutButton = SecondaryButton()
    private let addButton = UIButton()
    
    
    private let weekView:UIView = {
       let view = UIView()
        
        view.backgroundColor = .blue.withAlphaComponent(0.2)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addButtonBorder(with: Resourses.Colors.separator, height: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkOutButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(addButton)
        addView(allWorkOutButton)
        addView(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkOutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkOutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkOutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkOutButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkOutButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
            
            
        ])
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Resourses.Strings.NavBar.overview
        titleLabel.textColor = Resourses.Colors.titleGray
        titleLabel.font = Resourses.Fonts.helveticaRegular(witch: 22)
        
        allWorkOutButton.setTitle(Resourses.Strings.OverView.allWorkOutButton)
     
        addButton.setImage(Resourses.Images.Common.add, for: .normal)
        
    }
}

