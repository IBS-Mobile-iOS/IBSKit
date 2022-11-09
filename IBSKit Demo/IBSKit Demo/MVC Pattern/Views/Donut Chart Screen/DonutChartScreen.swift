//
//  DonutChartScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 21.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - DonutChartScreen

final class DonutChartScreen: UIViewController {

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



    // MARK: - Overriding parent methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()

        setupViews()

        makeLayout()
    }



    // MARK: - Private functions

    private func setupNavigationController() {
        navigationItem.title = "\(IBSDonutChart.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black

        view.addSubview(donutChartView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            donutChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donutChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            donutChartView.widthAnchor.constraint(equalToConstant: 360.0),
            donutChartView.heightAnchor.constraint(equalToConstant: 360.0)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct DonutChartScreen_Preview: PreviewProvider {

    static var previews: some View {
        DonutChartScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
