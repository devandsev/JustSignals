//
//  JustSignals.swift
//  JustSignals
//
//  Created by Andrey Sevrikov on 23/02/2018.
//  Copyright © 2018 Andrey Sevrikov. All rights reserved.
//

import Foundation

public class Signal<T> {
    
    public typealias Callback = (T) -> Void
    
    private var subscriptions: [Subscription<T>] = []
    
    var subscriptionsCount: Int {
        return subscriptions.count
    }
    
    public init() {
    }
    
    public func subscribe(with observer: AnyObject, onEvent callback: @escaping Callback) {
        cleanInvalidSubscriptions()
        
        let subscription = Subscription<T>(observer: observer, callback: callback)
        subscriptions.append(subscription)
    }
    
    public func unsubscribe(_ observer: AnyObject) {
        subscriptions = subscriptions.filter { $0.observer !== observer }
    }
    
    public func fire(_ data: T) {
        cleanInvalidSubscriptions()
        
        subscriptions.forEach { $0.callback(data) }
    }
    
    private func cleanInvalidSubscriptions() {
        subscriptions = subscriptions.filter { $0.observer != nil }
    }
}

class Subscription<T> {
    
    typealias Callback = (T) -> Void
    
    weak var observer: AnyObject?
    let callback: Callback
    
    init(observer: AnyObject, callback: @escaping Callback) {
        self.observer = observer
        self.callback = callback
    }
}
