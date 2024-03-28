//
//  LaunchViewModel.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation

final class LaunchViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var view: LaunchView
    
    // MARK: - Methods
    
    init() {
        self.view = .root
    }
}
