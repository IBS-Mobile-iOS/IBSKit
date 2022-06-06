//
//  PreviewBoothScreenExtensions.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 21.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - UITableViewDelegate

extension PreviewBoothScreen: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let currentAbility = PreviewBoothAbilitiesList(rawValue: indexPath.row)
        else { return }

        let abilitiesViewController: UIViewController

        switch currentAbility {
        case .specification:
            abilitiesViewController = SpecificationsScreen()
        case .hapticFeedback:
            abilitiesViewController = HapticFeedbackScreen()
        case .pieChartView:
            abilitiesViewController = PieChartScreen()
        case .donutChartView:
            abilitiesViewController = DonutChartScreen()
        case .progressViews:
            abilitiesViewController = ProgressViewsScreen()
        case .blurVisualFXView:
            abilitiesViewController = BlurVisualFXViewScreen()
        case .vibrancyVisualFXView:
            abilitiesViewController = VibrancyVisualFXViewScreen()
        }

        self.navigationController?.pushViewController(abilitiesViewController,
                                                      animated: true)
    }
}



// MARK: - UITableViewDataSource

extension PreviewBoothScreen: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { PreviewBoothAbilitiesList.allCases.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        else {
            return UITableViewCell()
        }

        guard
            let currentAbility = PreviewBoothAbilitiesList(rawValue: indexPath.row)
        else {
            return UITableViewCell()
        }

        switch currentAbility {
        case .specification:
            cell.textLabel?.text =
"""
\(String(describing: IBSApp.self)) & \(String(describing: IBSSDK.self)) & \(String(describing: IBSDevice.self))
"""
        case .hapticFeedback:
            cell.textLabel?.text = String(describing: IBSHaptic.self)
        case .pieChartView:
            cell.textLabel?.text = String(describing: IBSPieChartView.self)
        case .donutChartView:
            cell.textLabel?.text = String(describing: IBSDonutChartView.self)
        case .progressViews:
            cell.textLabel?.text =
"""
\(String(describing: IBSProgressBarView.self)) & \(String(describing: IBSRingProgressBarView.self))
"""
        case .blurVisualFXView:
            cell.textLabel?.text = String(describing: IBSBlurVisualFXView.self)
        case .vibrancyVisualFXView:
            cell.textLabel?.text = String(describing: IBSVibrancyVisualFXView.self)
        }

        return cell
    }
}
