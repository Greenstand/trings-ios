//
//  Observable.swift
//  trings
//
//  Created by Robert Huber on 11/7/22.
//

import Foundation
class Observable<T> {
    var listener: ((T)->Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T)->Void) {
        listener = closure
        listener?(value)
    }
}
