//
//  Result.swift
//  SharedPackages
//
//  Created by Yauheni Paulavets on 12.11.22.
//

import Foundation

public enum Result<ModelType> {
    
    case data(ModelType)
    
    case error(Error)
}
