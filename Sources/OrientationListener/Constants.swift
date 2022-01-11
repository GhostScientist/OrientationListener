//
//  Constants.swift
//  
//
//  Created by Dakota Kim on 1/11/22.
//

import Foundation

struct Constants {
    static let standardDeviceMotionSamplingInterval : TimeInterval = 1.0 // Start with once a second.
    static let minDeviceMaxXAxis: Double = 0.65
    static let minDeviceMinXAxis: Double = -0.65
}

enum DeviceOrientation: Int {
    case portrait = 1
    case landscapeLeft = 2
    case landscapeRight = 3
}
