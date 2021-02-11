//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Daniel Rocha on 28/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = HomeView(
            onTappedButtonStartClosure: onTappedReloadButtonClosure
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func onTappedReloadButtonClosure() {
        let quizViewController = QuizViewController()
        navigationController?.pushViewController(quizViewController, animated: true)
    }
    
    private func hideNavBar () {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

