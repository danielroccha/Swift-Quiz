//
//  UIFont.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 30/01/21.
//

import UIKit


extension UILabel {
    
    enum FontSize: CGFloat {
        case small = 14
        case caption = 16
        case body = 18
        case regular = 20
        case subtitle = 24
        case title = 26
        case bigTitle = 30
        case headLine = 34
    }
    
    enum FontWeight: String {
        case normal = "AvenirNext-Regular"
        case semibold = "AvenirNext-Medium"
        case ultrabold = "AvenirNext-Heavy"
        case bold = "AvenirNext-Bold"
    }
    
    func font(size: FontSize, weight: FontWeight)  {
        let customFont = UIFont(name: weight.rawValue, size: size.rawValue)
        if let customFont = customFont { font = customFont }
    }
}
