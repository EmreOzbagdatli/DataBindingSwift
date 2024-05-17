//
//  ViewController.swift
//  DataBindingSwift
//
//  Created by Emre Özbağdatlı on 18.05.2024.
//

import UIKit
import Combine

class ClockViewController: UIViewController {

    @IBOutlet weak var combineTimeLabel: UILabel!
    @IBOutlet weak var observableTimeLabel: UILabel!
    @IBOutlet weak var closureTimeLabel: UILabel!
    var cancellables: Set<AnyCancellable> = []
    
    var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        starTimer()

    }
    
    func setBindings() {
        viewModel.didChangeTime = { [unowned self] viewModel in
            self.closureTimeLabel.text = viewModel.closureTime
        }
        viewModel.observableTime.bind { [unowned self] time in
            self.observableTimeLabel.text = time
        }
        viewModel.$combineTime
            .compactMap { String($0) }
            .assign(to: \.text, on: combineTimeLabel)
            .store(in: &cancellables)
    }
    
    func starTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.checkTime()
        }
    }
}
