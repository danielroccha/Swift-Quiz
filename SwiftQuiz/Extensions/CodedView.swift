//
//  CodedView.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 29/01/21.
//

import Foundation
import UIKit


protocol ViewCodeConfigurator {
    func addSubviews()
    func setupConstraintsSubviews()
}

extension ViewCodeConfigurator {
    fileprivate func initLayout (){
        addSubviews()
        setupConstraintsSubviews()
    }
}

open class CodedView: UIView, ViewCodeConfigurator {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func setupConstraintsSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}
