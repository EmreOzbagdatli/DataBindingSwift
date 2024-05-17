//
//  Observable.swift
//  DataBindingSwift
//
//  Created by Emre Özbağdatlı on 18.05.2024.
//

import Foundation
class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
        listener?(value)
    }
}
