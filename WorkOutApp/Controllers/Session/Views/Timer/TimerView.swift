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
        //        lable.text = "12:45"
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
        //        lable.text = "02:45"
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
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
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
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLable.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(with: "COMPLETED", andValue: roundedPercent)
        remainingPercentView.configure(with: "REMAINING", andValue: 100 - roundedPercent)
        
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
            
            //            self.timerProgress -= 0.1
            
            self.timerProgress -= self.timerDuration * 0.01
            
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
        setupView(bottomStackView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
            
        ].forEach (timerStackView.addArrangedSubview)
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainingPercentView
            
        ].forEach (bottomStackView.addArrangedSubview)
        
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
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
    }
}

private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ? [minutesStr, secondStr].joined(separator: ":") : [hoursStr,minutesStr, secondStr].joined(separator: ":")
    }
}
