//
//  TimerManager.swift
//  Hummy
//
//  Created by Nyla Wilson on 2/8/26.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    @Published var timeRemainingTimer1: Int = 60
    @Published var timeRemainingTimer2: Int = 5
    @Published var isRunning: Bool = false

    private var timer1Cancellable: AnyCancellable?
    private var timer2Cancellable: AnyCancellable?
    private let interval: TimeInterval = 1.0

    func startTimer1() {
        pauseAllTimers()
        isRunning = true
        timer1Cancellable = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemainingTimer1 > 0 {
                    self.timeRemainingTimer1 -= 1
                } else {
                    self.pauseAllTimers()
                } // if else statement ending brace
            } // sink ending brace
    } // func ending brace

    func startTimer2() {
        pauseAllTimers()
        isRunning = true
        timer2Cancellable = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemainingTimer2 > 0 {
                    self.timeRemainingTimer2 -= 1
                } else {
                    self.pauseAllTimers()
                    if self.timeRemainingTimer1 > 0 {
                        self.startTimer1()
                    } // if statement ending brace
                } // if else statement ending brace
            } // sink ending brace
    } // func ending brace

    func pauseAllTimers() {
        timer1Cancellable?.cancel()
        timer2Cancellable?.cancel()
        isRunning = false
    } // func ending brace
    
} // class ending brace
