//
//  MotionService.swift
//  
//
//  Created by Dakota Kim on 1/11/22.
//
//

import CoreMotion
import UIKit

class MotionService {
    
    // MARK: - Properties
    var motionManager: CMMotionManager?
    var intervalTimer: Timer?
    
    func startMotionUpdates(_ actionOnRotation: @escaping DeviceRotationClosure) {
        motionManager = CMMotionManager()
        
        motionManager?.deviceMotionUpdateInterval = Constants.standardDeviceMotionSamplingInterval
        motionManager?.showsDeviceMovementDisplay = true // What's this do?
        
        motionManager?.startDeviceMotionUpdates()
        
        var currentOrientation : UIDeviceOrientation = .unknown { // Unknown default
            didSet {
                if currentOrientation != oldValue {
                    print("Device orientation changed to \(currentOrientation)")
                    actionOnRotation(currentOrientation)
                }
            }
        }
        
        let fetchMotionDataBlock: (Timer) -> Void = { [weak self] (_) in
            if let data = self?.motionManager?.deviceMotion {
                let xAxis = data.gravity.x
                if xAxis > Constants.minDeviceMaxXAxis {
                    currentOrientation = .landscapeRight
                } else if xAxis < Constants.minDeviceMinXAxis {
                    currentOrientation = .landscapeLeft
                } else {
                    currentOrientation = .portrait
                }
            }
        }
        intervalTimer = Timer(fire: Date(), interval: Constants.standardDeviceMotionSamplingInterval, repeats: true, block: fetchMotionDataBlock)
        
        // Add the timer to the current run loop.
        guard let timer = self.intervalTimer else {
            assertionFailure()
            return
        }
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    }
    
    func stopMotionUpdates() {
        guard let manager = motionManager else { return }
        manager.stopDeviceMotionUpdates()
    }
    
    func orientationDidChange(_ to: UIDeviceOrientation) { }
}
