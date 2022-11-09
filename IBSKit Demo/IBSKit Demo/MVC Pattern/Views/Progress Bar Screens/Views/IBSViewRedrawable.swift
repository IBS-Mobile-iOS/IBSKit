//
//  IBSViewRedrawable.swift
//  IBSKit Demo
//
//  Created by Dimka Novikov on 16.07.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - IBSViewRedrawable

///
///
///
@available(iOS 12.0, *)
public protocol IBSViewRedrawable: AnyObject {
    
    // MARK: - Public methods
    
    ///
    ///
    ///
    func redraw() -> Void
}
