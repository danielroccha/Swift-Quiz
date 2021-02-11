//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 05/02/21.
//

import Foundation


class Quiz {
    
    let question: String
    let answers: [String]
    private let correctAnswer: String
    
    init(question: String, answers:[String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
    func validateAnswer(_ index: Int) -> Bool {
        let answer = answers[index]
        return answer == correctAnswer
    }
    
    deinit {
        print("Liberou quiz da memória")
    }
    
}
