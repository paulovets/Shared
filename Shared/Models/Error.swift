//
//  Error.swift
//  SharedPackages
//
//  Created by Yauheni Paulavets on 12.11.22.
//

import Foundation

public protocol DomainError: Error {

    var identifier: Int { get }

    var errorCode: String { get }
    
    var localizedDescription: String { get }
    
    var details: [String: Any]? { get }
}
