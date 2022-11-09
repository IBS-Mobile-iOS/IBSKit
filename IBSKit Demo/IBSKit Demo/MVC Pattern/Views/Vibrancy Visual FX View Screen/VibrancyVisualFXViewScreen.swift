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

//    // MARK: - Private properties
//
//    private let pieChartView: IBSPieChartView = {
//        let pieChartView = IBSPieChartView()
//
//        pieChartView.total = .init(value: 30.0,
//                                   color: .blue,
//                                   offset: 15.0)
//
//        pieChartView.segments = [
//            .init(style: .filled, value: 3, color: .systemPink),
//            .init(style: .dashed, value: 7, color: .cyan),
//            .init(style: .triangled, value: 5, color: .red),
//            .init(style: .dashed, value: 10, color: .green)
//        ]
//
//        pieChartView.pattern = .init(size: 4.0,
//                                     repeatsCount: 30,
//                                     direction: .topLeftCorner)
//
//        pieChartView.textAttributes = .init(
//            text: "30.0",
//            color: .yellow,
//            font: .boldSystemFont(ofSize: 80.0),
//            shadow: .init(color: .orange,
//                          offset: CGSize(width: 4.0,
//                                         height: 4.0),
//                          blur: 3.0,
//                          opacity: 1.0)
//        )
//
//        pieChartView.redraw()
//
//        pieChartView.isUserInteractionEnabled = false
//        pieChartView.clipsToBounds = true
//        pieChartView.translatesAutoresizingMaskIntoConstraints = false
//        return pieChartView
//    }()
//
//    private let vibrancyVisualFXView: IBSVibrancyVisualFXView = {
//        let vibrancyVisualFXView = IBSVibrancyVisualFXView()
//        vibrancyVisualFXView.isUserInteractionEnabled = false
//        vibrancyVisualFXView.clipsToBounds = true
//        vibrancyVisualFXView.translatesAutoresizingMaskIntoConstraints = false
//        return vibrancyVisualFXView
//    }()
//
//    private let label: UILabel = {
//        let label = UILabel()
//        label.text = "\(IBSVibrancyVisualFXView.self)"
//        label.font = .boldSystemFont(ofSize: 26.0)
//        label.textAlignment = .center
//        label.baselineAdjustment = .alignCenters
//        label.isUserInteractionEnabled = false
//        label.clipsToBounds = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var slider: UISlider = {
//        let slider = UISlider()
//        slider.minimumValue = 0.0
//        slider.maximumValue = 1.0
//        slider.value = 0.5
//        slider.addTarget(self,
//                         action: #selector(self.changeVibrancyVisualFXIntensity(_:)),
//                         for: .valueChanged)
//        slider.isUserInteractionEnabled = true
//        slider.clipsToBounds = false
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        return slider
//    }()
//
//
//
//    // MARK: - Overriding parent methods
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupNavigationController()
//
//        setupViews()
//
//        makeLayout()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        vibrancyVisualFXView.layer.cornerRadius = vibrancyVisualFXView.bounds.width / 2.0
//    }
//
//
//
//    // MARK: - Private functions
//
//    private func setupNavigationController() {
//        navigationItem.title = "\(IBSVibrancyVisualFXView.self)"
//
//        navigationController?.navigationBar.prefersLargeTitles = false
//    }
//
//    private func setupViews() {
//        view.backgroundColor = .black
//
//        view.addSubview(pieChartView)
//
//        vibrancyVisualFXView.intensity = CGFloat(slider.value)
//        vibrancyVisualFXView.style.vibrancy = .label
//        view.addSubview(vibrancyVisualFXView)
//
//        vibrancyVisualFXView.fillContentView(with: label)
//
//        view.addSubview(slider)
//    }
//
//    private func makeLayout() {
//        NSLayoutConstraint.activate([
//            pieChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pieChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            pieChartView.widthAnchor.constraint(equalToConstant: 360.0),
//            pieChartView.heightAnchor.constraint(equalToConstant: 360.0)
//        ])
//
//        NSLayoutConstraint.activate([
//            vibrancyVisualFXView.topAnchor.constraint(equalTo: pieChartView.topAnchor,
//                                                      constant: -30.0),
//            vibrancyVisualFXView.leadingAnchor.constraint(equalTo: pieChartView.leadingAnchor,
//                                                          constant: -30.0),
//            vibrancyVisualFXView.trailingAnchor.constraint(equalTo: pieChartView.trailingAnchor,
//                                                           constant: 30.0),
//            vibrancyVisualFXView.bottomAnchor.constraint(equalTo: pieChartView.bottomAnchor,
//                                                         constant: 30.0)
//        ])
//
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: vibrancyVisualFXView.topAnchor),
//            label.leadingAnchor.constraint(equalTo: vibrancyVisualFXView.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: vibrancyVisualFXView.trailingAnchor),
//            label.bottomAnchor.constraint(equalTo: vibrancyVisualFXView.bottomAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            slider.topAnchor.constraint(equalTo: pieChartView.bottomAnchor,
//                                        constant: 120.0),
//            slider.leadingAnchor.constraint(equalTo: pieChartView.leadingAnchor,
//                                            constant: 30.0),
//            slider.trailingAnchor.constraint(equalTo: pieChartView.trailingAnchor,
//                                             constant: -30.0),
//        ])
//    }
//
//
//
//    // MARK: - Event handlers
//
//    @objc
//    private func changeVibrancyVisualFXIntensity(_ sender: UISlider) {
//        vibrancyVisualFXView.intensity = CGFloat(slider.value)
//    }
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
