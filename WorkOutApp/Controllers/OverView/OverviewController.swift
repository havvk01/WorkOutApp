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

}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(navBar)
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
            header.heightAnchor.constraint(equalToConstant: 32)
            
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        navigationController?.navigationBar.isHidden = true
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
    }
}


