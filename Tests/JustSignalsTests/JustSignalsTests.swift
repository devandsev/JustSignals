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
        
        let signal = Signal()
        signal.subscribe(with: self) {
            fired = true
        }
        
        // when
        signal.fire()
        
        // then
        XCTAssertTrue(fired)
    }
    
    func testMultipleFire() {
        // provided
        var counter = 0
        
        let signal = Signal()
        signal.subscribe(with: self) {
            counter += 1
        }
        
        // when
        signal.fire()
        signal.fire()
        
        // then
        XCTAssertEqual(counter, 2)
    }
    
    func testDispose() {
        // provided
        let signal = Signal()
        let counter = Counter()
        
        var subscribers = [Subscriber()]
        subscribers.first!.setup(with: signal, counter: counter)
        
        // when
        signal.fire()
        subscribers.removeAll()
        signal.fire()
        
        // then
        XCTAssertEqual(counter.i, 1)
    }
    
    // MARK: - Helpers
    
    class Counter {
        var i = 0
    }
    
    class Subscriber {
        
        func setup(with signal: Signal, counter: Counter) {
            signal.subscribe(with: self) {
                counter.i += 1
            }
        }
    }
}
