//
//  File.swift
//  
//
//  Created by Dakota Kim on 1/11/22.
//

import Foundation
import UIKit

extension UIDeviceOrientation {
    var orientationName : String {
        switch self {
        case .portrait:
            return "Portrait"
        case .landscapeLeft:
            return "LandscapeLeft"
        case .landscapeRight:
            return "LandscapeRight"
        default:
            return "Doesn't matter"
        }
    }
}
