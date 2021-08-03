//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by eyal avisar on 30/07/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    var title: String {get}
    
    var correctCount: Int {get}
    var incorrectCount: Int {get}
    
    func advanceToNextQuestion() -> Bool
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    func questionIndexTitle() -> String
}

