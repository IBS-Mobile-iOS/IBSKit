//
//  SceneDelegate.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 21.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - SceneDelegate

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Public properties

    var window: UIWindow?



    // MARK: - Public methods

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let viewController = PreviewBoothScreen()

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = .systemBackground

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
    }
}

