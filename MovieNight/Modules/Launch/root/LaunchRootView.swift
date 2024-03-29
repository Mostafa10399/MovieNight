//
//  LaunchRootView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

struct LaunchRootView: View {
    
    let viewModel: LaunchRootViewModel
    
    var body: some View {
        Image(.launchBackground)
            .resizable()
            .aspectRatio(3/6, contentMode: .fill)
            .ignoresSafeArea()
            .onAppear{
                viewModel.viewDidAppear()
            }
    }
}

#Preview {
    LaunchRootView(viewModel: LaunchRootViewModel(goToHomeNavigationView: MainViewModel()))
}

