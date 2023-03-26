//
//  TabBarController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureApperance()
//        switchTo(tab: .progress)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureApperance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inActive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue )
            
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
        private func getController(for tab: Tabs) -> WABaseController {
            switch tab {
            case .overview: return OverviewController()
            case .session: return SessionController()
            case .progress: return ProgressController()
            case .settings: return SettingsController()
            }
        }
}
//        let overviewController = OverviewController()
//        let sessionController = SessionController()
//        let progressController = ProgressController()
//        let settingsController = SettingsController()
//
//        let overviewNavigation = NavBarController(rootViewController: overviewController)
//        let sessionNavigation = NavBarController(rootViewController: sessionController)
//        let progressNavigation = NavBarController(rootViewController: progressController)
//        let settingsNavigation = NavBarController(rootViewController: settingsController)
//
//        overviewNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.overview,
//                                                     image: Resourses.Images.TabBar.overview,
//                                                     tag: Tabs.overview.rawValue)
//
//        sessionNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.session,
//                                                     image: Resourses.Images.TabBar.session,
//                                                     tag: Tabs.session.rawValue)
//        progressNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.progress,
//                                                     image: Resourses.Images.TabBar.progress,
//                                                     tag: Tabs.progress.rawValue)
//
//        settingsNavigation.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.settings,
//                                                     image: Resourses.Images.TabBar.settings,
//                                                     tag: Tabs.settings.rawValue)
        
//        setViewControllers([
//            overviewNavigation,
//            sessionNavigation,
//            progressNavigation,
//            settingsNavigation
//        ],
//                           animated: false)
//    }
