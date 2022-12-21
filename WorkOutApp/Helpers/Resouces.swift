//
//  Resourses.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        
        static let background  = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")

    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
        }
        }
        enum NavBar {
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "WorkOut Progress"
            static var settings = "Settings"
        }
        
        enum OverView {
            static let allWorkOutButton = "All WorkOuts"
        }
        
        enum Session {
            static let navBarStart = "Start     "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"

            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"

            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"

            static let stepsCounter = "Steps Counter"
        }
        
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
        }
        
        enum Settings {
            
        }
    }
    
    enum Images {
        enum TabBar {
            
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "session_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
            
            
        }
        enum Common {
        static var downArrow = UIImage(named: "down_arrow")
        static var add = UIImage(named: "add_button")
        }
        
        enum Session {
            enum Stats {
                static var averagePace = UIImage(named: "stats_averagePace")
                static var heartRate = UIImage(named: "stats_heartRate")
                static var totalDistance = UIImage(named: "stats_totalDistance")
                static var totalSteps = UIImage(named: "stats_totalSteps")
            }            
        }
        
    }
    
    enum Fonts {
        static func helveticaRegular(witch size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
