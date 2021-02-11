//
//  HomeViewController.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 28/01/21.
//

import UIKit

final class HomeView: CodedView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(onTappedButtonStartClosure: @escaping () -> Void) {
        self.onTappedButtonStartClosure = onTappedButtonStartClosure
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    private var onTappedButtonStartClosure: () -> Void
    
    var imageViewBackground: UIImageView = {
        let view =  UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "swift_logo")
        return view
    }()
    
    var startButtonView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(actionStartbutton), for: .touchUpInside)
        button.setTitle("Começar Quiz", for: .normal)
        button.isHighlighted = false
        return button
    }()
    
    var title: UILabel = {
        let textView = UILabel()
        textView.text = "Swift Quiz"
        textView.font(size: .bigTitle, weight: .semibold)
        textView.textColor = .black
        textView.textAlignment = .center
        return textView
    }()
    
    @objc private func actionStartbutton() {
        onTappedButtonStartClosure()
        startButtonView.makeAnimation()
    }
    
    override func addSubviews() {
        addSubview(imageViewBackground)
        addSubview(startButtonView)
        addSubview(title)
    }
    
    override func setupConstraintsSubviews() {
        imageViewBackground.anchor(widthConstant: 150, heightConstant: 150)
        imageViewBackground.anchorCenterSuperView()
        
        title.anchor(bottom: imageViewBackground.topAnchor, bottomConstant: .xlarge)
        title.anchorCenterXToSuperView()
        
        startButtonView.anchor(bottom: bottomAnchor, bottomConstant: .medium, widthConstant: 350, heightConstant: 60 )
        startButtonView.anchorCenterXToSuperView()
    }
}
