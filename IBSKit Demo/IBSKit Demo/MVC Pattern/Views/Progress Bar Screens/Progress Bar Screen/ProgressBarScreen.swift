//
//  ProgressBarScreen.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 10.06.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - ProgressBarScreen

final class ProgressBarScreen: UIViewController {


}



// MARK: - Live Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI

@available(iOS 15.0, *)
struct ProgressBarScreen_Preview: PreviewProvider {

    static var previews: some View {
        ProgressBarScreen()
            .livePreview()
            .previewDisplayName("iPhone 12 Pro Max")
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
    }
}
#endif
