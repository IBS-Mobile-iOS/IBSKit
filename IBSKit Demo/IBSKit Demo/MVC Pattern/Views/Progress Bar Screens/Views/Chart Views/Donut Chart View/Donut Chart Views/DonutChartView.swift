////
////  DonutChartView.swift
////  IBSKit Demo
////
////  Created by Dimka Novikov on 01.08.2022.
////  Copyright © 2022 IBS. All rights reserved.
////
//
//
//// MARK: Import section
//
//import UIKit
//
//
//
//// MARK: - DonutChartView
//
//@available(iOS 12.0, *)
//final class DonutChartView: UIView, IBSViewRedrawable {
//
//    // MARK: - Public enumerations
//
//    enum SegmentStyle: Int32, CaseIterable {
//        case dashed
//        case filled
//        case triangled
//    }
//
//    enum PatternDirection: Int32, CaseIterable {
//        case topLeftCorner
//        case topSide
//        case topRightCorner
//        case leftSide
//        case rightSide
//        case bottomLeftCorner
//        case bottomSide
//        case bottomRightCorner
//    }
//
//
//
//    // MARK: - Public structures
//
//    struct Segment {
//        var style: SegmentStyle
//        var value: CGFloat
//        var color: UIColor
//
//        init(style: SegmentStyle = .filled,
//             value: CGFloat,
//             color: UIColor = .clear) {
//            self.style = style
//            self.value = value
//            self.color = color
//        }
//    }
//
//    struct Pattern {
//        var size: CGFloat
//        var repeatsCount: CGFloat
//        var direction: PatternDirection
//
//        init(size: CGFloat,
//             repeatsCount: CGFloat,
//             direction: PatternDirection = .topSide) {
//            self.size = size
//            self.repeatsCount = repeatsCount
//            self.direction = direction
//        }
//    }
//
//
//
//    // MARK: - Private structures
//
//    private struct Angle {
//        var start: CGFloat
//        var end: CGFloat
//    }
//
//    private struct PrecalculatedPie {
//        var angle: Angle
//        var segment: Segment
//    }
//
//
//
//    // MARK: - Public properties
//
//    var width: CGFloat = 10.0
//
//    var cap: CGLineCap = .butt
//
//    var pies: [Segment] = []
//
//    var pattern: Pattern = .init(size: 10.0, repeatsCount: 5.0) {
//        willSet {
//            DonutChartView.patternSize = newValue.size
//        }
//    }
//
//
//
//    // MARK: - Static properties
//
//    private static var patternSize: CGFloat = 0.0
//
//}
