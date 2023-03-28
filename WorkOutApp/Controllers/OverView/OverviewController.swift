//
//  ViewController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

class OverviewController: WABaseController {

    private let navBar = OverviewNavBar()

    private let header = SectionHeaderView()
    
    private let cell = TrainingCellView()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cell.roundCorners([.allCorners], radius: 15)
    }
    
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navBar)
        view.addSubview(header)
        view.addSubview(cell)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 32),

            cell.topAnchor.constraint(equalTo: header.bottomAnchor),
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cell.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        navigationController?.navigationBar.isHidden = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        header.translatesAutoresizingMaskIntoConstraints = false
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        header.configure(with: dateFormatter.string(from: Date()))
        cell.configure(with: "Warm Up Cardio", subtitle: "Stair Climber 10 Minutes", isDone: true)
//        cell.layoutIfNeeded()
//        cell.roundCorners([.allCorners], radius: 5)

    }
}


