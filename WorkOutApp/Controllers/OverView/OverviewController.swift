//
//  ViewController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

class OverviewController: BaseController {

    private let allWorkOutButton = SecondaryButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(allWorkOutButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkOutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkOutButton.widthAnchor.constraint(equalToConstant: 130)
            
            
        ])
    }
    
    override func configure() {
        super.configure()
        
        allWorkOutButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkOutButton.setTitle(Resourses.Strings.OverView.allWorkOutButton)
        allWorkOutButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
    }
}

@objc extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All workouts button tapped 1")
    }
}
