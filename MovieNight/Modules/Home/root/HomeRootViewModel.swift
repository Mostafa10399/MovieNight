//
//  HomeRootViewModel.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation
import CoreKit

final class HomeRootViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let discoverRepository: DiscoverRepository
        
    // MARK: - Methods
    
    init() {
        self.discoverRepository = MainDiscoverRepository(remoteApis: MovieNightDiscoverApis())
        getData()
    }
    
    func getData() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            let repo = try await strongSelf.discoverRepository.getNowPlaying()
            print(repo)
        }
    }
    
}
