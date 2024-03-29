//
//  HomeRootView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

struct HomeRootView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: HomeRootViewModel
    
    // MARK: - CodeView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeRootView(viewModel: HomeRootViewModel())
}
