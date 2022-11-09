//
//  BlurVisualFXViewScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 24.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - BlurVisualFXViewScreen

final class BlurVisualFXViewScreen: UIViewController {

    // MARK: - Private properties

    private let donutChartView: IBSDonutChart = {
        let donutChartView = IBSDonutChart()

        donutChartView.total = .init(value: 30.0, color: .blue, offset: 8.0)

        donutChartView.width = 32.0

        donutChartView.cap = .round

        donutChartView.segments = [
            .init(style: .filled, value: 3, color: .systemPink),
            .init(style: .filled, value: 7, color: .cyan),
            .init(style: .dashed, value: 5, color: .red),
            .init(style: .filled, value: 10, color: .green)
        ]

        donutChartView.pattern = .init(size: 2.0,
                                       repeatsCount: 50,
                                       direction: .topLeftCorner)

        donutChartView.textAttributes = .init(
            text: "30.0",
            color: .yellow,
            font: .boldSystemFont(ofSize: 80.0),
            shadow: .init(color: .orange,
                          offset: CGSize(width: 4.0,
                                         height: 4.0),
                          blur: 3.0,
                          opacity: 1.0)
        )

        donutChartView.redraw()

        donutChartView.isUserInteractionEnabled = false
        donutChartView.clipsToBounds = true
        donutChartView.translatesAutoresizingMaskIntoConstraints = false
        return donutChartView
    }()

    private let blurVisualFXView: IBSBlurVisualFX = {
        let blurVisualFXView = IBSBlurVisualFX()
        blurVisualFXView.isUserInteractionEnabled = false
        blurVisualFXView.clipsToBounds = true
        blurVisualFXView.translatesAutoresizingMaskIntoConstraints = false
        return blurVisualFXView
    }()

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        slider.addTarget(self,
                         action: #selector(self.changeBlurVisualFXIntensity(_:)),
                         for: .valueChanged)
        slider.isUserInteractionEnabled = true
        slider.clipsToBounds = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupViews()

        makeLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        blurVisualFXView.layer.cornerRadius = blurVisualFXView.bounds.width / 2.0
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSBlurVisualFX.self)"
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black

        view.addSubview(self.donutChartView)

        blurVisualFXView.intensity = CGFloat(slider.value)
        view.addSubview(blurVisualFXView)

        view.addSubview(slider)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            donutChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donutChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            donutChartView.widthAnchor.constraint(equalToConstant: 360.0),
            donutChartView.heightAnchor.constraint(equalToConstant: 360.0)
        ])

        NSLayoutConstraint.activate([
            blurVisualFXView.topAnchor.constraint(equalTo: donutChartView.topAnchor,
                                                  constant: -30.0),
            blurVisualFXView.leadingAnchor.constraint(equalTo: donutChartView.leadingAnchor,
                                                      constant: -30.0),
            blurVisualFXView.trailingAnchor.constraint(equalTo: donutChartView.trailingAnchor,
                                                       constant: 30.0),
            blurVisualFXView.bottomAnchor.constraint(equalTo: donutChartView.bottomAnchor,
                                                     constant: 30.0)
        ])

        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: donutChartView.bottomAnchor,
                                        constant: 120.0),
            slider.leadingAnchor.constraint(equalTo: donutChartView.leadingAnchor,
                                            constant: 30.0),
            slider.trailingAnchor.constraint(equalTo: donutChartView.trailingAnchor,
                                             constant: -30.0),
        ])
    }



    // MARK: - Event handlers

    @objc
    private func changeBlurVisualFXIntensity(_ sender: UISlider) {
        blurVisualFXView.intensity = CGFloat(slider.value)
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)

import SwiftUI

@available(iOS 15.0, *)
struct BlurVisualFXViewScreen_Preview: PreviewProvider {

    static var previews: some View {
        BlurVisualFXViewScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
