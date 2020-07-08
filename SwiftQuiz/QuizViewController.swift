//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by EPR Exatron on 02/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    
    
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    var quizManager = QuizManager()
    
    //método qu sempre executa quando uma view é carregada
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // método é chamado sempre que uma tela vai aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //frame => propriedade que tem opçoes de altura, largura e etc.
        viTimer.frame.size.width = view.frame.size.width

        //colocar self., pois estamos dentro de uma clousure
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }

        getNewQuiz()
        
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let buttom = btAnswers[i]
            buttom.setTitle(option, for: .normal)
        }
    }
    
    //chama o identifier Segue que foi determinado com o nome "resultSegue"
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroller = segue.destination as!
        ResultViewController
        resultViewcontroller.totalAnswers = quizManager.totalAnswers
        resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
        
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
        
    }
    

}
