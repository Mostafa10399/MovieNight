//
//  LaunchNavigationController.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI
import Combine
import UIKit

final class LaunchNavigationController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: LaunchViewModel
    private let lunchRootView: LaunchRootView
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    override func loadView() {
        super.loadView()
        let vc = UIHostingController(rootView: lunchRootView) .with { $0.modalPresentationStyle = .overCurrentContext }
        viewControllers = [vc]
    }
    
    init(
        viewModel: LaunchViewModel,
        lunchRootView: LaunchRootView) {
            self.viewModel = viewModel
            self.lunchRootView = lunchRootView
            self.cancellable = []
            super.init()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeToViewModel()
    }
    
    private func observeToViewModel() {
        let publisher = viewModel.$view.eraseToAnyPublisher()
        subscribe(to: publisher)
    }
    
    private func subscribe(to publisher: AnyPublisher<LaunchView, Never>) {
        publisher
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.present($0)
            }
            .store(in: &cancellable)
    }
    
    private func present(_ view: LaunchView) {
        switch view {
        case .root:
            presetLaunchRootView()
        }
    }
    
    private func presetLaunchRootView() {
        popToRootViewController(animated: false)
    }
    
}
