//
//  JustSignals.swift
//  JustSignals
//
//  Created by Andrey Sevrikov on 23/02/2018.
//  Copyright © 2018 Andrey Sevrikov. All rights reserved.
//

import Foundation

public class Signal {
    
    private var subscriptions: [Subscription] = []
    
    public init() {
    }
    
    public func subscribe(with observer: AnyObject, onEvent callback: @escaping () -> Void) {
        let subscription = Subscription(observer: observer, callback: callback)
        subscriptions.append(subscription)
    }
    
    public func fire() {
        subscriptions = subscriptions.filter { $0.observer != nil }
        subscriptions.forEach { $0.callback() }
    }
}

class Subscription {
    
    weak var observer: AnyObject?
    let callback: () -> Void
    
    init(observer: AnyObject, callback: @escaping () -> Void) {
        self.observer = observer
        self.callback = callback
    }
}
