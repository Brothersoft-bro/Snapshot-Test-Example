//
//  TutorialViewModel+Datasource.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//
import UIKit

extension TutorialViewModel {
    
    // Populates the view model with steps data
    func setupViewModel() {
        setupStep1()
        setupStep2()
        setupStep3()
        setupStep4()
        setupStep5()
    }
    
    // Prepares the data for step 1
    private func setupStep1() {
        let choice1 = ChoiceViewModel()
        choice1.title = "16\nlines"
        choice1.color = UIColor.imagiLightBlue
        
        let choice2 = ChoiceViewModel()
        choice2.title = "64\nlines"
        choice2.color = UIColor.imagiYellow
        choice2.isCorrect = true
        
        let choice3 = ChoiceViewModel()
        choice3.title = "8\nlines"
        choice3.color = UIColor.imagiPink
        
        let step1 = StepViewModel()
        step1.progress = 20
        step1.title = "How many lines of code would it take to create this awesome rainbow animation if you had to set the color of to create this awesome rainbow animation if you had to set the color of every pixel individually?"
        step1.choices = [choice1, choice2, choice3]
        step1.buttonState = .check
        step1.buttonEnabled = false
        step1.matrix = [
            [.imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed],
            [.imagiOrange, .imagiOrange, .imagiOrange, .imagiOrange, .imagiOrange, .imagiOrange, .imagiOrange, .imagiOrange],
            [.imagiYellow, .imagiYellow, .imagiYellow, .imagiYellow, .imagiYellow, .imagiYellow, .imagiYellow, .imagiYellow],
            [.imagiGreen, .imagiGreen, .imagiGreen, .imagiGreen, .imagiGreen, .imagiGreen, .imagiGreen, .imagiGreen],
            [.imagiLightBlue, .imagiLightBlue, .imagiLightBlue, .imagiLightBlue, .imagiLightBlue, .imagiLightBlue, .imagiLightBlue, .imagiLightBlue],
            [.imagiBlue, .imagiBlue, .imagiBlue, .imagiBlue, .imagiBlue, .imagiBlue, .imagiBlue, .imagiBlue],
            [.imagiPurple, .imagiPurple, .imagiPurple, .imagiPurple, .imagiPurple, .imagiPurple, .imagiPurple, .imagiPurple],
            [.imagiPink, .imagiPink, .imagiPink, .imagiPink, .imagiPink, .imagiPink, .imagiPink, .imagiPink],
        ]
        steps.append(step1)
    }
    
    // Prepares the data for step 2
    private func setupStep2() {
        let step2 = StepViewModel()
        step2.progress = 40
        step2.title = "That’s a lot of code! Thankfully, we could simplify this by using a technique called looping! Let’s try looping through one line first. Debug the code below and see what happens!"
        step2.codeSnippet = "for pixel in range(0,4):\n     m[pixel][0]=red"
        step2.codeSnippetExpanded = true
        steps.append(step2)
    }
    
    // Prepares the data for step 3
    private func setupStep3() {
        let step3 = StepViewModel()
        step3.progress = 60
        step3.title = "You set half of the first line to red! You did this by looping through the pixels using a for loop. The range was set to (0,4), with 0 being the lower bound, and 4 being the upper bound. Notice that the last colored pixel was on column “3”. This is because for loops loop through every number smaller than the upper bound. This means that since we wanted all the pixels up until 3 to be set to red, we have to set the upper bound to 4."
        step3.codeSnippet = "for pixel in range(0,4):\n     m[pixel][0]=red"
        step3.codeSnippetExpanded = false
        step3.buttonState = .nextWithDelay
        step3.buttonEnabled = false
        step3.matrix = [
            [.imagiRed, .imagiRed, .imagiRed, .imagiRed, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
        ]
        steps.append(step3)
    }
    
    // Prepares the data for step 4
    private func setupStep4() {
        let choice1 = ChoiceViewModel()
        choice1.title = "8"
        choice1.color = UIColor.imagiLightBlue
        choice1.isCorrect = true
        
        let choice2 = ChoiceViewModel()
        choice2.title = "7"
        choice2.color = UIColor.imagiYellow
        
        let choice3 = ChoiceViewModel()
        choice3.title = "64"
        choice3.color = UIColor.imagiPink
        
        let step4 = StepViewModel()
        step4.progress = 80
        step4.title = "What would you change the upper bound of the range to in order to color the full row?"
        step4.codeSnippet = "for pixel in range(0,?):\n     m[pixel][0]=red"
        step4.codeSnippetExpanded = false
        step4.choices = [choice1, choice2, choice3]
        step4.buttonState = .check
        step4.buttonEnabled = false
        step4.matrix = [
            [.imagiRed, .imagiRed, .imagiRed, .imagiRed, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
        ]
        steps.append(step4)
    }
    
    // Prepares the data for step 5
    private func setupStep5() {
        let step5 = StepViewModel()
        step5.progress = 100
        step5.title = "Congratulations! You colored in the first row of your rainbow!"
        step5.codeSnippet = "for pixel in range(0,8):\n     m[pixel][0]=red"
        step5.codeSnippetExpanded = false
        step5.buttonState = .next
        step5.buttonEnabled = true
        step5.matrix = [
            [.imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed, .imagiRed],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
            [.black, .black, .black, .black, .black, .black, .black, .black],
        ]
        steps.append(step5)
    }
}
