//
//  Clock.swift
//  DataBindingSwift
//
//  Created by Emre Özbağdatlı on 18.05.2024.
//

import Foundation

class Clock {
    static var currentTime: (() -> String) = {
        let today = Date()
        let hours = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let minutesString = String(format: "%02d", minutes)
        let seconds = (Calendar.current.component(.second, from: today))
        let secondsString = String(format: "%02d", seconds)
        return "\(hours):\(minutesString):\(secondsString)"
    }
}
