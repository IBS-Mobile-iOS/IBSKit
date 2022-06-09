//
//  ProgressViewsScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 06.04.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - ProgressViewsScreen

@available(iOS 13.0, *)
final class ProgressViewsScreen: UIViewController {

    // MARK: - Private properties

    private let progressBarView: IBSProgressBarView = {
        let progressBarView = IBSProgressBarView()
        progressBarView.isUserInteractionEnabled = true
        progressBarView.clipsToBounds = true
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        return progressBarView
    }()

    private let ringProgressBarView: IBSRingProgressBarView = {
        let ringProgressBarView = IBSRingProgressBarView()
        ringProgressBarView.colors = .init(ring: .white,
                                           progress: .red)
        ringProgressBarView.width = 20.0
        ringProgressBarView.cap = .round
        ringProgressBarView.isUserInteractionEnabled = true
        ringProgressBarView.clipsToBounds = true
        ringProgressBarView.translatesAutoresizingMaskIntoConstraints = false
        return ringProgressBarView
    }()



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSPieChartView.self) & \(IBSRingProgressBarView.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(ringProgressBarView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            ringProgressBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ringProgressBarView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ringProgressBarView.widthAnchor.constraint(equalToConstant: 360.0),
            ringProgressBarView.heightAnchor.constraint(equalToConstant: 360.0)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct ProgressViewsScreen_Preview: PreviewProvider {

    static var previews: some View {
        ProgressViewsScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
