//
//  HomeNavigationController.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI
import Combine

final class HomeNavigationController: NiblessNavigationController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    private let homeRootView: HomeRootView
    private let makeMovieDetailsView: ((Int) -> MovieDetailsView)
    private var cancellable: Set<AnyCancellable>
    
    // MARK: - Methods
    
    init(
        viewModel: HomeViewModel,
        homeRootView: HomeRootView,
        movieDetailsViewFactory: @escaping (Int) -> MovieDetailsView) {
            self.viewModel = viewModel
            self.homeRootView = homeRootView
            self.makeMovieDetailsView = movieDetailsViewFactory
            self.cancellable = []
            super.init()
            let vc = UIHostingController(rootView: homeRootView)
            vc.with {
                let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                backBarButtonItem.tintColor = UIColor.accent
                $0.navigationItem.backBarButtonItem = backBarButtonItem
            }
            viewControllers = [vc]
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeToViewModel()
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Montserrat-SemiBold", size: 16) ?? .systemFont(ofSize: 16)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Montserrat-Bold", size: 24) ?? .systemFont(ofSize: 24)
        ]
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    private func observeToViewModel() {
        let publisher = viewModel.$view.eraseToAnyPublisher()
        subscribe(to: publisher)
    }
    
    private func subscribe(to publisher: AnyPublisher<HomeView, Never>) {
        publisher
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.present($0)
            }
            .store(in: &cancellable)
    }
    
    private func present(_ view: HomeView) {
        switch view {
        case .root:
            presentHomeRootView()
        case let .movieDetails(id):
            presentMovieDetailsView(id: id)
        }
    }
    
    private func presentHomeRootView() {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    private func presentMovieDetailsView(id: Int) {
        let vc = UIHostingController(rootView: makeMovieDetailsView(id)).with { $0.modalPresentationStyle = .overFullScreen }
        pushViewController(vc, animated: true)
    }
    
}
