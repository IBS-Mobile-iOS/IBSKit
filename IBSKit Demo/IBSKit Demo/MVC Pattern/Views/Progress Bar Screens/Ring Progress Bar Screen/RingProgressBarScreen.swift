//
//  RingProgressBarScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 10.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - RingProgressBarScreen

final class RingProgressBarScreen: UIViewController {

    // MARK: - Private properties

    private let multiplicationListTableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.isUserInteractionEnabled = false
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupTableView()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSRingProgressBar.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupTableView() {
//        multiplicationListTableView.delegate = self
        multiplicationListTableView.dataSource = self
    }

    private func setupViews() {
        view.backgroundColor = .black

        view.addSubview(multiplicationListTableView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            multiplicationListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            multiplicationListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            multiplicationListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            multiplicationListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct RingProgressBarScreen_Preview: PreviewProvider {

    static var previews: some View {
        RingProgressBarScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
