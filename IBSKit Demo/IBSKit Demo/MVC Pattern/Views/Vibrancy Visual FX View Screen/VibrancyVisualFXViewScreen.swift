//
//  VibrancyVisualFXViewScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 24.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - VibrancyVisualFXViewScreen

final class VibrancyVisualFXViewScreen: UIViewController {

    // MARK: - Private properties

    private let pieChart: IBSPieChart = {
        let pieChartView = IBSPieChart()

        pieChartView.total = .init(value: 30.0,
                                   color: .blue,
                                   offset: 15.0)

        pieChartView.segments = [
            .init(style: .filled, value: 3, color: .systemPink),
            .init(style: .dashed, value: 7, color: .cyan),
            .init(style: .triangled, value: 5, color: .red),
            .init(style: .dashed, value: 10, color: .green)
        ]

        pieChartView.pattern = .init(size: 4,
                                     repeatsCount: 30,
                                     direction: .topLeftCorner)

        pieChartView.textAttributes = .init(
            text: "30.0",
            color: .yellow,
            font: .boldSystemFont(ofSize: 80),
            shadow: .init(
                color: .orange,
                opacity: 1,
                radius: 3,
                offset: .init(
                    width: 4,
                    height: 4
                )
            )
        )

        pieChartView.redraw()

        pieChartView.isUserInteractionEnabled = false
        pieChartView.clipsToBounds = true
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        return pieChartView
    }()

    private let vibrancyVisualFX: IBSVibrancyVisualFX = {
        let vibrancyVisualFX = IBSVibrancyVisualFX()
        vibrancyVisualFX.isUserInteractionEnabled = false
        vibrancyVisualFX.clipsToBounds = true
        vibrancyVisualFX.translatesAutoresizingMaskIntoConstraints = false
        return vibrancyVisualFX
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "\(IBSVibrancyVisualFX.self)"
        label.font = .boldSystemFont(ofSize: 26.0)
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.isUserInteractionEnabled = false
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        slider.addTarget(self,
                         action: #selector(self.changeVibrancyVisualFXIntensity(_:)),
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

        vibrancyVisualFX.layer.cornerRadius = vibrancyVisualFX.bounds.width / 2.0
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSVibrancyVisualFX.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black

        view.addSubview(pieChart)

        vibrancyVisualFX.intensity = CGFloat(slider.value)
        vibrancyVisualFX.style.vibrancy = .label
        view.addSubview(vibrancyVisualFX)

        vibrancyVisualFX.fillContentView(with: label)

        view.addSubview(slider)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            pieChart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pieChart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pieChart.widthAnchor.constraint(equalToConstant: 360.0),
            pieChart.heightAnchor.constraint(equalToConstant: 360.0)
        ])

        NSLayoutConstraint.activate([
            vibrancyVisualFX.topAnchor.constraint(equalTo: pieChart.topAnchor,
                                                      constant: -30.0),
            vibrancyVisualFX.leadingAnchor.constraint(equalTo: pieChart.leadingAnchor,
                                                          constant: -30.0),
            vibrancyVisualFX.trailingAnchor.constraint(equalTo: pieChart.trailingAnchor,
                                                           constant: 30.0),
            vibrancyVisualFX.bottomAnchor.constraint(equalTo: pieChart.bottomAnchor,
                                                         constant: 30.0)
        ])

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: vibrancyVisualFX.topAnchor),
            label.leadingAnchor.constraint(equalTo: vibrancyVisualFX.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: vibrancyVisualFX.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: vibrancyVisualFX.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: pieChart.bottomAnchor,
                                        constant: 120.0),
            slider.leadingAnchor.constraint(equalTo: pieChart.leadingAnchor,
                                            constant: 30.0),
            slider.trailingAnchor.constraint(equalTo: pieChart.trailingAnchor,
                                             constant: -30.0),
        ])
    }



    // MARK: - Event handlers

    @objc
    private func changeVibrancyVisualFXIntensity(_ sender: UISlider) {
        vibrancyVisualFX.intensity = CGFloat(slider.value)
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct VibrancyVisualFXViewScreen_Preview: PreviewProvider {

    static var previews: some View {
        VibrancyVisualFXViewScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
