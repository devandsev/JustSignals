//
//  JustSignalsTests.swift
//  JustSignals
//
//  Created by Andrey Sevrikov on 23/02/2018.
//  Copyright © 2018 Andrey Sevrikov. All rights reserved.
//

import Foundation
import XCTest
import JustSignals

class JustSignalsTests: XCTestCase {
    
    // MARK: - Tests
    
    func testFire() {
        // provided
        var fired = false
        
        let signal = Signal<Void>()
        signal.subscribe(with: self) {
            fired = true
        }
        
        // when
        signal.fire(())
        
        // then
        XCTAssertTrue(fired)
    }
    
    func testFireWithData() {
        // provided
        var currentData = 0
        
        let signal = Signal<Int>()
        signal.subscribe(with: self) { data in
            currentData = data
        }
        
        // when
        signal.fire(4)
        
        // then
        XCTAssertEqual(currentData, 4)
    }
    
    func testMultipleFire() {
        // provided
        var counter = 0
        
        let signal = Signal<Void>()
        signal.subscribe(with: self) {
            counter += 1
        }
        
        // when
        signal.fire(())
        signal.fire(())
        
        // then
        XCTAssertEqual(counter, 2)
    }
    
    func testDispose() {
        // provided
        let signal = Signal<Void>()
        let counter = Counter()
        
        var subscribers = [Subscriber()]
        subscribers.first!.setup(with: signal, counter: counter)
        
        // when
        signal.fire(())
        subscribers.removeAll()
        signal.fire(())
        
        // then
        XCTAssertEqual(counter.i, 1)
    }
    
    // MARK: - Helpers
    
    class Counter {
        var i = 0
    }
    
    class Subscriber {
        
        func setup<T>(with signal: Signal<T>, counter: Counter) {
            signal.subscribe(with: self) { data in
                counter.i += 1
            }
        }
    }
}
