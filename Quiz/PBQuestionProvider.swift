//
//  QuestionProvider.swift
//  Quiz
//
//  Created by William Bennett on 6/7/14.
//  Copyright (c) 2014 William Bennett. All rights reserved.
//

import Foundation

protocol PBProvidesQuestionAnswer {
	
	func getQuestionAnswer()->PBQuestionAnswer
}

protocol PBLoadsQuestionAnswer {
	func loadQuestionAnswer(qa: PBQuestionAnswer)
}

protocol PBAdvances {
	func next()
}

class PBQuestionAnswerProvider:
	
	PBProvidesQuestionAnswer,
	PBLoadsQuestionAnswer,
	PBAdvances {

	var idx: Int
	var entities: PBQuestionAnswer[]
	
	init(){
		self.idx = -1
		self.entities = []
	}
	
	convenience init(pentities: PBQuestionAnswer[])
	{
		self.init();
		self.entities = pentities
	}
	
	
	
	/*
	 Advances the provider to the next question
	*/
	func next() {
		self.idx += 1
		if self.idx > self.entities.count {
			self.idx = 0
		}
	}
	
	/*
	Retrieves the current questions answer
	*/
	func getQuestionAnswer() -> PBQuestionAnswer {
		if (idx >= self.entities.count || idx < 0) {
			idx = Int(0)
		}
		return entities[idx]
	}
	
	func loadQuestionAnswer(qa: PBQuestionAnswer) {
		entities += qa;
	}
	
}