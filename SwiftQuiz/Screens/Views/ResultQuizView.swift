//
//  ResultQuizView.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 05/02/21.
//

import UIKit

class ResultQuiz: CodedView {
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        totalQuestionsAnswered: Int,
        totalWrongQuestions: Int,
        totalHitQuestions: Int,
        percentHit: Int
    ) {
        self.totalQuestionsAnswered = totalQuestionsAnswered
        self.totalWrongQuestions = totalWrongQuestions
        self.totalHitQuestions = totalHitQuestions
        self.percentHit = percentHit
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    private var totalQuestionsAnswered: Int
    private var totalWrongQuestions: Int
    private var totalHitQuestions: Int
    private var percentHit: Int
    private var didTapCommunity: (() -> Void)?
    
    
    private lazy var textResult: UILabel = {
        let textResult = UILabel()
        textResult.text = "Resultado"
        textResult.textColor = .black
        textResult.textAlignment = .center
        textResult.font(size: .bigTitle, weight: .semibold)
        return textResult
    }()
    
    private lazy var textTotalQuestions: UILabel = {
        let textTotalQuestions = UILabel()
        textTotalQuestions.text = "Perguntas respondidas: \(totalQuestionsAnswered)"
        textTotalQuestions.textColor = .black
        textTotalQuestions.font(size: .regular, weight: .semibold)
        return textTotalQuestions
    }()
    
    private lazy var textHitQuestion: UILabel = {
        let textHitQuestion = UILabel()
        textHitQuestion.text = "Perguntas certas: \(totalHitQuestions)"
        textHitQuestion.textColor = .systemGreen
        textHitQuestion.font(size: .regular, weight: .semibold)
        return textHitQuestion
    }()
    
    private lazy var textMissedQuestion: UILabel = {
        let textMissedQuestion = UILabel()
        textMissedQuestion.text = "Perguntas erradas: \(totalWrongQuestions)"
        textMissedQuestion.textColor = .red
        textMissedQuestion.font(size: .regular, weight: .semibold)
        return textMissedQuestion
    }()
    
    private lazy var textPercent: UILabel = {
        let textPercent = UILabel()
        textPercent.text = "\(percentHit)%"
        textPercent.textColor = .black
        textPercent.font(size: .headLine, weight: .bold)
        return textPercent
    }()
    
    private lazy var resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("Reiniciar", for: .normal)
        resetButton.backgroundColor = .systemBlue
        resetButton.layer.cornerRadius = 10
        resetButton.addTarget(self, action: #selector(didTapResetButton), for:  .touchUpInside)
        return resetButton
    }()
    
    override func addSubviews() {
        addSubview(textResult)
        addSubview(textTotalQuestions)
        addSubview(textHitQuestion)
        addSubview(textMissedQuestion)
        addSubview(textPercent)
        addSubview(resetButton)
    }
    
    override func setupConstraintsSubviews() {
        constraintTextResult()
        constraintTextTotalQuestions()
        constraintTextHitQuestions()
        constraintTextMissedQuestions()
        constraintTextPercent()
        constraintButtonReset()
    }
    
    private func constraintTextResult() {
        textResult.anchor(top: safeAreaLayoutGuide.topAnchor)
        textResult.anchorCenterXToSuperView()
    }
    
    private func constraintTextTotalQuestions() {
        textTotalQuestions.anchor(
            top: textResult.bottomAnchor,
            leading: safeAreaLayoutGuide.leadingAnchor,
            topConstant: .small,
            leadingConstant: .small
        )
    }
    
    private func constraintTextHitQuestions() {
        textHitQuestion.anchor(
            top: textTotalQuestions.bottomAnchor,
            leading: safeAreaLayoutGuide.leadingAnchor,
            topConstant: .small,
            leadingConstant: .small
        )
    }
    
    private func constraintTextMissedQuestions() {
        textMissedQuestion.anchor(
            top: textHitQuestion.bottomAnchor,
            leading: safeAreaLayoutGuide.leadingAnchor,
            topConstant: .small,
            leadingConstant: .small
        )
    }
    
    private func constraintTextPercent() {
        textPercent.anchorCenterSuperView()
    }
    
    private func constraintButtonReset() {
        resetButton.anchor(bottom: safeAreaLayoutGuide.bottomAnchor, widthConstant: 350, heightConstant: 60)
        resetButton.anchorCenterXToSuperView()
    }
    
    @objc private func didTapResetButton() {
        didTapCommunity?()
    }
    
}

extension ResultQuiz {
//MARK: - Public Methods
    
    func onTapButtonReset(_ action: @escaping () -> Void) {
        self.didTapCommunity = action
    }
}
