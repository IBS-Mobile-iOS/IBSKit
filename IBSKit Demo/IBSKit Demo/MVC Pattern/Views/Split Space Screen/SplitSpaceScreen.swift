//
//  SplitSpaceScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 08.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - SplitSpaceScreen

final class SplitSpaceScreen: IBSSplitSpaceController {

    // MARK: - Public properties

    override var minimumLeftSideSize: CGFloat { 100.0 }
    override var maximumLeftSideSize: CGFloat { 280.0 }

    override var leftSideInitialState: IBSSplitSpaceController.LeftSideInitialState { .unfold }

    override var leftSideSupportedState: IBSSplitSpaceController.LeftSideSupportedState {
        IBSDevice.current.device.type == .iPhone ? .all : .unfold
    }



    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setupSplitSpaceController()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupSplitSpaceController()
    }
    
    
    
    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupViews()

        setupSwipeGestureRecognizer()
    }



    // MARK: - Private functions

    private func setupSplitSpaceController() {
        leftSideViewController = LeftSideScreen()
        rightSideViewController = RightSideScreen()
    }

    private func setupNavigationController() {
        navigationItem.title = "\(IBSSplitSpaceController.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black
    }

    private func setupSwipeGestureRecognizer() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self,
                                                              action: #selector(self.handleSwipeGesture(_:)))
        swipeGestureRecognizer.direction = [.left, .right]

        leftSideViewController.view.addGestureRecognizer(swipeGestureRecognizer)
    }



    // MARK: - Event handlers

    @objc
    private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        collapseLeftSide(with: 0.2)
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
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
