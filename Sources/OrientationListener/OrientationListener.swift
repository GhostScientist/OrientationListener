import UIKit
import CoreMotion

public protocol OrientationListenerDelegate {
    func didRotateDevice(_ orientation: UIDeviceOrientation)
}

public typealias DeviceRotationClosure = (UIDeviceOrientation) -> Void

public struct OrientationListener {
    public private(set) var text = "Hello, World!"
    
    var motionService: MotionService
    
    public var delegate: OrientationListenerDelegate?
    
    public init() {
        motionService = MotionService()
    }
    
    public func startDeviceOrientationUpdates(_ onChange: @escaping DeviceRotationClosure) {
        motionService.startMotionUpdates { orientation in
            print("Orientation change detected. Calling didRotateDevice on delegate...")
            self.delegate?.didRotateDevice(orientation)
        }
    }
    
    public func stopDeviceOrientationUpdates() {
        motionService.stopMotionUpdates()
    }
}
