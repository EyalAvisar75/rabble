//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by eyal avisar on 30/07/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {
    //MARK:- Properties

    public var title: String {
        return questionGroup.title
    }
    
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    private let questions: [Question]
    
    //MARK:- Object Lifecycle
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        let randomSource = GKRandomSource.sharedRandom()
        
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    //MARK:- Question Strategy
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {return false}
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)" + "\\" + "\(questions.count)"
    }
}
