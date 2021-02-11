//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 02/02/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizManager = QuizManager()
    
    private lazy var quizView: QuizView = {
        var answers: [String] = ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"]
        
        let quizView = QuizView(
            textAnswers: answers,
            onSelectOption: onSelectOption,
            onTimeEnd: onTimeEnd
        )
        
        return quizView
    }()
    
    override func loadView() {
        view = quizView
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizView.animationViewProgress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNewQuiz()
    }
    
    private func onSelectOption(index: Int) {
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    
    private func onTimeEnd(){
        let totalQuestionsAnswered = quizManager.totalAnswers
        let totalHitQuestionsAnswered = quizManager.totalHitAnswers
        let totalWrongQuestions = quizManager.totalAnswers - quizManager.totalHitAnswers
        let percentHit =  (quizManager.totalHitAnswers * 100) / quizManager.totalAnswers
        
        let resultViewController = ResultViewController(
            totalQuestionsAnswered: totalQuestionsAnswered,
            totalWrongQuestions: totalWrongQuestions,
            totalHitQuestions: totalHitQuestionsAnswered,
            percentHit: percentHit
        )
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    private func getNewQuiz()  {
        quizManager.refreshQuiz()
        
        quizView.setQuiz(
            question: quizManager.question,
            options: quizManager.answers
        )
    }
}
