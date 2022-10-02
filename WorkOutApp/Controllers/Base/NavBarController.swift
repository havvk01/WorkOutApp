//
//  NavBarController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resourses.Colors.titleGray,
            .font: Resourses.Fonts.helveticaRegular(witch: 17)
        ]
        
        navigationBar.addButtonBorder(with: Resourses.Colors.separator, height: 1)
    }
}
