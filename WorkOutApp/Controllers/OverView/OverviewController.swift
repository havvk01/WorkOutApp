//
//  ViewController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

class OverviewController: BaseController {

    private let navBar = OverviewNavBar()
//    private let allWorkOutButton = SecondaryButton()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//    }


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
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        navigationController?.navigationBar.isHidden = true
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
    }
}


