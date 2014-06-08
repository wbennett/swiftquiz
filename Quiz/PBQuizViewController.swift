//
//  PBQuizViewController.swift
//  Quiz
//
//  Created by William Bennett on 6/7/14.
//  Copyright (c) 2014 William Bennett. All rights reserved.
//

import UIKit

class PBQuizViewController: UIViewController {
	
	@IBOutlet weak var questionLabel: UILabel;
	@IBOutlet weak var answerLabel: UILabel;
	
	weak var provider: PBQuestionAnswerProvider?

	init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		provider = Container.resolve() as PBQuestionAnswerProvider
	}
	
	@IBAction func showQuestion(AnyObject){
		
		if provider == nil
		{
			return
		}

		provider?.next()
		questionLabel.text = provider?.getQuestionAnswer().question
		
		answerLabel.text = "???"
	}
	
	@IBAction func showAnswer(AnyObject){
		answerLabel.text = provider?.getQuestionAnswer().answer
	}
	
	
}
