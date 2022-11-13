//
//  LoadingState.swift
//  SharedPackages
//
//  Created by Yauheni Paulavets on 12.11.22.
//

import Foundation

public enum LoadingState<Model> {
    
    case loading
    
    case data(Model)
    
    case error(Error)
}
