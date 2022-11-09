//
//  SpecificationsScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 25.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit
import IBSKit



// MARK: - SpecificationsScreen

final class SpecificationsScreen: UIViewController {

    // MARK: - Private properties

    private let textView: UITextView = {
        let textView = UITextView()

        let appVersion = IBSApp.info.version
        let appBuild = IBSApp.info.build
        
        let sdkVersion = IBSSDK.info.version
        let sdkBuild = IBSSDK.info.build

        let device = IBSDevice.current.device
        let operatingSystem = IBSDevice.current.operatingSystem
        let software = IBSDevice.current.software
        let hardware = IBSDevice.current.hardware

        textView.text =
"""
App Ver. \(appVersion.major).\(appVersion.minor).\(appVersion.patch) · Build \(appBuild)


SDK Ver. \(sdkVersion.major).\(sdkVersion.minor).\(sdkVersion.patch) · Build \(sdkBuild)


Device Specification:

Type: \(device.type.rawValue)
Model: \(device.model.rawValue)
Name: \(device.name.rawValue)


Operating System:

OS Type: \(operatingSystem.type.rawValue)
OS Name: \(operatingSystem.name.rawValue)
OS Fullname: \(operatingSystem.fullname)
OS Version: \(operatingSystem.version.major).\(operatingSystem.version.minor).\(operatingSystem.version.patch)


Software:

Application Type: \(software.appType.rawValue)
Is Simulator Environment: \(software.isSimulatorEnvironment)
Is Low Power Mode Enabled: \(software.isLowPowerModeEnabled)


Hardware [Connectivity]:

Bluetooth: \(hardware.connectivity.bluetooth.rawValue)
GPS: \(hardware.connectivity.gps.rawValue)
iBeacon: \(hardware.connectivity.iBeacon.rawValue)


Hardware [IMU]:

Accelerometer: \(hardware.imu.accelerometer.rawValue)
Barometer: \(hardware.imu.barometer.rawValue)
Gyroscope: \(hardware.imu.gyroscope.rawValue)
Magnetometer: \(hardware.imu.magnetometer.rawValue)


Hardware [Network]:

Cellular: \(hardware.network.cellular.rawValue)
Wi-Fi: \(hardware.network.wifi.rawValue)
"""
        textView.font = .systemFont(ofSize: 20.0, weight: .regular)
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
        navigationItem.title = "\(IBSApp.self) & \(IBSSDK.self) & \(IBSDevice.self)"

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(textView)
    }

    private func makeLayout() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct SpecificationsScreen_Preview: PreviewProvider {

    static var previews: some View {
        SpecificationsScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
