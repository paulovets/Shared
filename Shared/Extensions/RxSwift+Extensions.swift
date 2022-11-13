//
//  RxSwift+Extensions.swift
//  SharedPackages
//
//  Created by Yauheni Paulavets on 12.11.22.
//

import Foundation
import RxSwift

public extension ObservableType {
    
    func filterNil<Type>() -> Observable<Type> where Element == Optional<Type> {
        flatMap { Observable.from(optional: $0) }
    }
}

public extension ReplaySubject {
    
    func value() -> Element? {
        var result: Element? = nil
        
        self.subscribe {
            result = $0
        }
        .dispose()
        
        return result
    }
}

public extension PrimitiveSequence {
    
    func retry(maxAttempts: Int, delay: Int) -> PrimitiveSequence<Trait, Element> {
        self.retry { errors in
            errors.enumerated().flatMap { (index, error) -> Observable<Int64> in
                if index <= maxAttempts {
                    return Observable<Int64>.timer(RxTimeInterval.milliseconds(delay),
                                                   scheduler: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
                } else {
                    return Observable.error(error)
                }
            }
        }
    }
}
