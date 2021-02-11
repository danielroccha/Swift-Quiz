//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 28/01/21.
//

import UIKit

final class ResultViewController: UIViewController {
    
    
    private var totalQuestionsAnswered: Int
    private var totalWrongQuestions: Int
    private var totalHitQuestions: Int
    private var percentHit: Int
    
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
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private lazy var resultView: ResultQuiz = {
        let view = ResultQuiz(totalQuestionsAnswered: totalQuestionsAnswered,
                              totalWrongQuestions: totalWrongQuestions,
                              totalHitQuestions: totalHitQuestions,
                              percentHit: percentHit)
        return view
    }()
    
    override func loadView() {
        view = resultView
        
        resultView.onTapButtonReset {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
