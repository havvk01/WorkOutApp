//
//  SessionController.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

class SessionController: WABaseController {
    private let timerView = TimerView()
    
    private let timerDuration = 5.0
    
    //WABaseInfoView = {
//        let view = TimerView()
        //WABaseInfoView(with: "Test", buttonTitle: "TestButton".uppercased())
//
//        return view
//    }()
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped{
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        
        setTitleForNavBarButton(timerView.state == .isRuning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart, at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        
        timerView.state = .isStopped
        setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
}



extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        

        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        
    }
}
