//
//  PieChartScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 21.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - PieChartScreen

final class PieChartScreen: UIViewController {

    // MARK: - Private properties

    private let pieChartView: IBSPieChart = {
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

        pieChartView.pattern = .init(size: 4.0,
                                     repeatsCount: 30,
                                     direction: .topLeftCorner)
        
        pieChartView.textAttributes = .init(
            text: "30.0",
            color: .yellow,
            font: .boldSystemFont(ofSize: 80.0),
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



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSPieChart.self)"
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black

        view.addSubview(pieChartView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            pieChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pieChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pieChartView.widthAnchor.constraint(equalToConstant: 360.0),
            pieChartView.heightAnchor.constraint(equalToConstant: 360.0)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct PieChartScreen_Preview: PreviewProvider {

    static var previews: some View {
        PieChartScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
