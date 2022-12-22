//
//  ProgressController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

final class ProgressController: WABaseController {
    
    
    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerfomance,
                                                            buttonTitle: R.Strings.Progress.last7Days)
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ProgressController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68)
            //            timerView.heightAnchor.constraint(equalToConstant: 500)
            
        ])
    }
    
    
    override func configureApperance() {
        super.configureApperance()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.NavBar.progress
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
        
        dailyPerformanceView.configure(with: [.init(value: "1", heightMultiplier: 0.2, title: "Mon"),
                                              .init(value: "2", heightMultiplier: 0.4, title: "Teu"),
                                              .init(value: "3", heightMultiplier: 0.6, title: "Wen"),
                                              .init(value: "4", heightMultiplier: 0.8, title: "Thu"),
                                              .init(value: "5", heightMultiplier: 1, title: "Fri"),
                                              .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
                                              .init(value: "2", heightMultiplier: 0.4, title: "Sun")])
    }
    
    
}
