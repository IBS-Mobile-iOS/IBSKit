//
//  HapticFeedbackScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 30.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - HapticFeedbackScreen

@available(iOS 13.0, *)
final class HapticFeedbackScreen: UIViewController {

    // MARK: - Private properties

    private lazy var buttons: [UIButton] = {
        var buttons: [UIButton] = []
        IBSHaptic.FeedbackType.allCases.forEach { _ in
            buttons.append(UIButton(type: .custom))
        }
        IBSHaptic.FeedbackType.allCases.enumerated().forEach { (index, feedbackType) in
            buttons[index].setTitle(feedbackType.rawValue,
                                    for: .normal)
            buttons[index].setTitleColor(.white,
                                         for: .normal)
            buttons[index].titleLabel?.font = .systemFont(ofSize: 20.0,
                                                          weight: .medium)
            buttons[index].backgroundColor = .link
            buttons[index].layer.cornerRadius = 14.0
            buttons[index].addTarget(self,
                                     action: #selector(self.buttonsTouchDown(_:)),
                                     for: .touchDown)
            buttons[index].addTarget(self,
                                     action: #selector(self.buttonsTouchUpInside(_:)),
                                     for: .touchUpInside)
            buttons[index].addTarget(self,
                                     action: #selector(self.buttonsTouchUpOutside(_:)),
                                     for: .touchUpOutside)
            buttons[index].isUserInteractionEnabled = true
            buttons[index].clipsToBounds = true
            buttons[index].translatesAutoresizingMaskIntoConstraints = false
        }
        return buttons
    }()

    private lazy var stackViews: [UIStackView] = {
        var stackViews: [UIStackView] = []
        for _ in 0 ... 2 {
            stackViews.append(UIStackView())
        }
        for i in 0 ... 2 {
            stackViews[0].addArrangedSubview(buttons[i])
        }
        for i in 3 ... (IBSHaptic.FeedbackType.allCases.count - 2) {
            stackViews[1].addArrangedSubview(buttons[i])
        }
        stackViews[2].addArrangedSubview(buttons.last!)
        stackViews.forEach { stackView in
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 10.0
            stackView.isUserInteractionEnabled = true
            stackView.clipsToBounds = true
            stackView.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.spacing = 20.0
        stackView.isUserInteractionEnabled = true
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        navigationItem.title = String(describing: IBSHaptic.self)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(mainStackView)
    }

    private func makeLayout() {
        buttons.forEach { button in
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 260.0),
                button.heightAnchor.constraint(equalToConstant: 50.0),
            ])
        }

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }



    // MARK: - Event handlers

    @objc
    private func buttonsTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: .zero) {
            sender.transform = CGAffineTransform(scaleX: 0.9,
                                                 y: 0.9)
        }
    }

    @objc
    private func buttonsTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: .zero) {
            sender.transform = .identity
        }
        IBSHaptic.feedback.execute(with: .init(rawValue: (sender.titleLabel?.text)!) ?? .error)
    }

    @objc
    private func buttonsTouchUpOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: .zero) {
            sender.transform = .identity
        }
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct HapticFeedbackScreen_Preview: PreviewProvider {

    static var previews: some View {
        HapticFeedbackScreen()
            .livePreview()
            .previewDisplayName("iPhone 13 Pro Max")
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
