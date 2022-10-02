//
//  BaseController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension BaseController {
    
    func addViews() {
        
    }
    
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Resourses.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar Right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at posititon: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resourses.Colors.active, for: .normal)
        button.setTitleColor(Resourses.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Resourses.Fonts.helveticaRegular(witch: 17)
        
        switch posititon {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
