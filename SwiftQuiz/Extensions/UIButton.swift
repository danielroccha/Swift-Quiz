//
//  UIButton.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 30/01/21.
//

import UIKit

extension UIButton {
    func makeAnimation() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        layer.add(pulse, forKey: nil)
    }
}
