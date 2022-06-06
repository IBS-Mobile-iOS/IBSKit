//
//  PreviewBoothScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 21.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - PreviewBoothScreen

@available(iOS 13.0, *)
final class PreviewBoothScreen: UIViewController {

    // MARK: - Private properties

    private let abilitiesListTableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.isUserInteractionEnabled = true
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAbilitiesListTableView()
        setupNavigationController()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupAbilitiesListTableView() {
        abilitiesListTableView.register(UITableViewCell.self,
                                        forCellReuseIdentifier: "Cell")

        abilitiesListTableView.delegate = self
        abilitiesListTableView.dataSource = self
    }

    private func setupNavigationController() {
        navigationItem.title = "IBSKit Features Preview"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(abilitiesListTableView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            abilitiesListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            abilitiesListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            abilitiesListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            abilitiesListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct PreviewBoothScreen_Preview: PreviewProvider {

    static var previews: some View {
        PreviewBoothScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
