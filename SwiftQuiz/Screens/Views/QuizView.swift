//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 02/02/21.
//

import UIKit

class QuizView: CodedView {
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        textAnswers: [String],
        onSelectOption: @escaping (Int) -> Void,
        onTimeEnd: @escaping () -> Void
    ) {
        self.textButtonsAnswers = textAnswers
        self.onSelectOption = onSelectOption
        self.onTimeEnd = onTimeEnd
        
        super.init(frame: .zero)
        backgroundColor = .white
        print("chamei o init")
    }
    
    private var textButtonsAnswers: [String]
    private var onSelectOption: (Int) -> Void
    private var onTimeEnd: () -> Void
    private var trailingConstraint = NSLayoutConstraint()
    
    private lazy var viewProgress: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        print("criei o viewProgress")
        return view
    }()
    
    private lazy var labelTimeLeft: UILabel = {
        let labelTimeLeft = UILabel()
        labelTimeLeft.text = "Tempo restante: 3:50"
        labelTimeLeft.font(size: .body, weight: .semibold)
        labelTimeLeft.textColor = .white
        print("criei o labelTimeLeft")
        return labelTimeLeft
    }()
    
    private lazy var labelQuestion: UILabel = {
        let labelQuestion = UILabel()
        labelQuestion.text = "Swift é bom ou não ?"
        labelQuestion.numberOfLines = 5
        labelQuestion.font(size: .regular, weight: .semibold)
        labelQuestion.textColor = .orange
        labelQuestion.textAlignment = .center
        print("criei o labelQuestion")
        return labelQuestion
    }()
    
    private var optionButtons: [UIButton] = []
    
    private lazy var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillProportionally
        buttonsStackView.spacing = 10
        print("criei o buttonsStackView")
        return buttonsStackView
    }()
    
    override func addSubviews() {
        addSubview(viewProgress)
        addSubview(labelTimeLeft)
        addSubview(labelQuestion)
        addSubview(buttonsStackView)
        addButtonsToStackView()
        print("adiconei as subview")
    }
    
    private func addButtonsToStackView(){
        for (index, textButton) in textButtonsAnswers.enumerated() {
            let buttonAnswer = UIButton()
            buttonAnswer.setTitle(textButton, for: .normal)
            buttonAnswer.setTitleColor(.orange, for: .normal)
            buttonAnswer.backgroundColor = .white
            buttonAnswer.layer.borderColor = UIColor.orange.cgColor
            buttonAnswer.layer.borderWidth = 1
            buttonAnswer.layer.cornerRadius = 5
            buttonAnswer.tag = index
            buttonAnswer.titleLabel?.lineBreakMode = .byWordWrapping
            buttonAnswer.titleLabel?.textAlignment = .center
            buttonAnswer.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
            optionButtons.append(buttonAnswer)
            
            buttonsStackView.addArrangedSubview(buttonAnswer)
        }
    }
    
    override func setupConstraintsSubviews() {
        constraintViewProgress()
        constraintLabelTimeLeft()
        constraintLabelQuestion()
        constraintButtonsStackView()
        constraintOptionButtons()
        print("adicionei as constraints")
    }
    
    private func constraintViewProgress() {
        viewProgress.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            topConstant: .xlarge,
            heightConstant: 52
        )
        
        trailingConstraint = viewProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 200)
        NSLayoutConstraint.activate([trailingConstraint])
    }
    
    private func constraintLabelTimeLeft() {
        labelTimeLeft.anchor(
            top: viewProgress.topAnchor,
            leading: viewProgress.leadingAnchor,
            leadingConstant: .small
        )
        labelTimeLeft.centerYAnchor.constraint(equalTo: viewProgress.centerYAnchor).isActive = true
    }
    
    private func constraintLabelQuestion() {
        labelQuestion.anchorCenterSuperView()
        labelQuestion.anchor(
            bottomConstant: .medium, widthConstant: 342
        )
    }
    
    private func constraintButtonsStackView() {
        buttonsStackView.anchor(top: labelQuestion.bottomAnchor, topConstant: .large, widthConstant: 342)
        buttonsStackView.anchorCenterXToSuperView()
    }
    
    private func constraintOptionButtons() {
        for buttonAnswer in optionButtons {
            buttonAnswer.anchor(heightConstant: 60)
        }
    }
}

extension QuizView {
    @objc private func answerButtonAction(sender: UIButton){
        sender.makeAnimation()
        if let index = optionButtons.firstIndex(of: sender) {
            onSelectOption(index)
        }
        print("Button tapped  with tag \(sender).")
    }
    
    // MARK: - Public methods
    
    func setQuiz(question: String, options: [String]) {
        labelQuestion.text = question
            
        for (index, item) in options.enumerated() {
            optionButtons[index].setTitle(item, for: .normal)
        }
    }
    
    func animationViewProgress() {
        self.trailingConstraint.constant = 30
        UIView.animate(withDuration: 5, delay: 0, options: .curveLinear) {
            self.viewProgress.layoutIfNeeded()
        } completion: { (success) in
            self.onTimeEnd()
        }
    }
}
