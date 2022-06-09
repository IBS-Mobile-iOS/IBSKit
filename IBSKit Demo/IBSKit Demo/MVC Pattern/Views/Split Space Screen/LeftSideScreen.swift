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
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .systemGray4
        view.isUserInteractionEnabled = false
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        computeFrames()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        computeFrames()
    }



    // MARK: - Private functions

    private func setupViews() {
        view.backgroundColor = .systemGray6

        view.addSubview(resizableView)
    }

    private func computeFrames() {
        resizableView.frame = .init(
            x: view.bounds.minX + 20.0,
            y: view.bounds.minY + 50.0,
            width: view.bounds.maxX - 40.0,
            height: view.bounds.maxY - 70.0
        )
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
