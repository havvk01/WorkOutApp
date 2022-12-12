//
//  TimerView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 07.12.2022.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLable: UILabel = {
       let lable = UILabel()
        lable.text = R.Strings.Session.elapsedTime
        lable.font = R.Fonts.helveticaRegular(witch: 14)
        lable.textColor = R.Colors.inActive
        lable.textAlignment = .center
        return lable
    }()
    
    private let elapsedTimeValueLable: UILabel = {
       let lable = UILabel()
        lable.text = "12:45"
        lable.font = R.Fonts.helveticaRegular(witch: 46)
        lable.textColor = R.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()
    
    private let remainingTimeLable: UILabel = {
       let lable = UILabel()
        lable.text = R.Strings.Session.remainingTime
        lable.font = R.Fonts.helveticaRegular(witch: 13)
        lable.textColor = R.Colors.inActive
        lable.textAlignment = .center
        return lable
    }()
    
    private let remainingTimeValueLable: UILabel = {
       let lable = UILabel()
        lable.text = "02:45"
        lable.font = R.Fonts.helveticaRegular(witch: 13)
        lable.textColor = R.Colors.titleGray
        lable.textAlignment = .center
        return lable
    }()
    
    private let timerStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let progressView = ProgressView()
//    =  {
//        let view = ProgressView()
//        view.drawProgress(with: 0.8)
//        return view
//    }()
    
    private var timer = Timer()
    
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
    var callBack: ((CGFloat) -> Void)?
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDeliver = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDeliver
        
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    
    func startTimer(completion: @escaping ((CGFloat) -> Void)) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callBack?(self.timerProgress)
//                completion(self.timerProgress)
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
        
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            
            self.timerProgress -= 0.1
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        setupView(progressView)
        setupView(timerStackView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable

        ].forEach {
            timerStackView.addArrangedSubview($0)
        }
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
    }
}
