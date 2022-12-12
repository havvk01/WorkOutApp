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

class WABaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constaintViews()
        configureApperance()
    }
}

@objc extension WABaseController {
    
    func setupViews() {
        
    }
    
    func constaintViews() {}
    func configureApperance() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("NavBar Left button tapped")
    }
    
    func navBarRightButtonHandler() {
        print("NavBar Right button tapped")
    }
}

extension WABaseController {
    
    func addNavBarButton(at posititon: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inActive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(witch: 17)
        
        switch posititon {
        case .left:
            button.addTarget(self, action:  #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action:  #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at posititon: NavBarPosition) {     
        switch posititon {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }

    }
}
