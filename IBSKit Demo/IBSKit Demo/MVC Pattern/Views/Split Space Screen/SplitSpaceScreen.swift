//
//  SplitSpaceScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 08.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - SplitSpaceScreen

@available(iOS 13.0, *)
final class SplitSpaceScreen: IBSSplitSpaceController {

    // MARK: - Public properties

    override var minimumLeftSideSize: CGFloat { 200.0 }
    override var maximumLeftSideSize: CGFloat { 300.0 }

    override var leftSideController: UIViewController { LeftSideScreen() }
    override var rightSideController: UIViewController { RightSideScreen() }



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }



    // MARK: - Private functions

    private func setupViews() {
        view.backgroundColor = .systemBackground
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct SplitSpaceScreen_Preview: PreviewProvider {

    static var previews: some View {
        SplitSpaceScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
