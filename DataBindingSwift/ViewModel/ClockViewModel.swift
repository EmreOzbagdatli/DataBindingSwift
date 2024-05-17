//
//  ClockViewModel.swift
//  DataBindingSwift
//
//  Created by Emre Özbağdatlı on 18.05.2024.
//

import Foundation
import Combine

class ClockViewModel {
    var didChangeTime: ((ClockViewModel) -> Void)?
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    var observableTime: Observable<String> = Observable("Observable")
    
    @Published var combineTime: String = "Combine"
    
    init() {
        closureTime = Clock.currentTime()
    }
    func checkTime() {
        closureTime = Clock.currentTime()
        observableTime.value = Clock.currentTime()
        combineTime = Clock.currentTime()
    }
}
