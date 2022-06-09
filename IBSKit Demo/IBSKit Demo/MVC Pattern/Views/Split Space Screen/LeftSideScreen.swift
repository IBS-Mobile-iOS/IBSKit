//
//  LeftSideScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 08.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - LeftSideScreen

@available(iOS 13.0, *)
final class LeftSideScreen: UIViewController {

    // MARK: - Private properties

    private let resizableView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.isUserInteractionEnabled = false
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupViews() {
        view.backgroundColor = .systemGreen

        view.addSubview(resizableView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            resizableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 30.0),
            resizableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -30.0),
            resizableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resizableView.heightAnchor.constraint(equalTo: resizableView.widthAnchor,
                                                  multiplier: 1.0)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct LeftSideScreen_Preview: PreviewProvider {

    static var previews: some View {
        LeftSideScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
