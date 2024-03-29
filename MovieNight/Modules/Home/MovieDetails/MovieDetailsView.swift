//
//  MovieDetailsView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    // MARK: - CodeView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MovieDetailsView(viewModel: MovieDetailsViewModel())
}
