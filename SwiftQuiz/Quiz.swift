//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by EPR Exatron on 03/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

// Classe responsável
import Foundation

class Quiz {
    
    let question: String //Representa a pergunta
    let options: [String] //Conter todas as opções para o usuário
    private let correctedAnswer: String //Vai armazenar toda a resposta correta do quiz
    
    //método construtor
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOption (_ index: Int) -> Bool { //_ index: Int => índice do botão
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    //Destruição da classe = OnDestroy Android
    deinit {
        print("Liberou quiz da memória")
    }
    
    
    
}
