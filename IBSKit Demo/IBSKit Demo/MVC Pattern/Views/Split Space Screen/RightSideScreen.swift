//
//  RightSideScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 08.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - RightSideScreen

@available(iOS 13.0, *)
final class RightSideScreen: UIViewController {

    // MARK: - Private properties

    private let imageViews: [UIImageView] = {
        let imageViews = [
            UIImageView(),
            UIImageView()
        ]
        imageViews[0].image = UIImage(systemName: "arrow.left")
        imageViews[1].image = UIImage(systemName: "arrow.right")
        imageViews.forEach { imageView in
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = false
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
        return imageViews
    }()

    private let labels: [UILabel] = {
        let labels = [
            UILabel(),
            UILabel()
        ]
        labels[0].text = "Swipe left to fold the left side"
        labels[1].text = "Swipe right to unfold the left side"
        labels.forEach { label in
            label.baselineAdjustment = .alignCenters
            label.textAlignment = .left
            label.isUserInteractionEnabled = false
            label.clipsToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        return labels
    }()

    private lazy var stackViews: [UIStackView] = {
        let stackViews = [
            UIStackView(),
            UIStackView()
        ]
        stackViews.enumerated().forEach { (index, stackView) in
            stackView.addArrangedSubview(imageViews[index])
            stackView.addArrangedSubview(labels[index])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 10.0
            stackView.isUserInteractionEnabled = false
            stackView.clipsToBounds = true
            stackView.translatesAutoresizingMaskIntoConstraints = false
        }
        imageViews.forEach { imageView in
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 20.0),
                imageView.heightAnchor.constraint(equalToConstant: 20.0)
            ])
        }
        return stackViews
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackViews.forEach { currentStackView in
            stackView.addArrangedSubview(currentStackView)
        }
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.isUserInteractionEnabled = false
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        view.addSubview(mainStackView)
    }

    private func computeFrames() {
        mainStackView.frame = .init(
            x: view.bounds.midX - 150.0,
            y: view.bounds.midY - 25.0,
            width: 300.0,
            height: 50.0
        )
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct RightSideScreen_Preview: PreviewProvider {

    static var previews: some View {
        RightSideScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
