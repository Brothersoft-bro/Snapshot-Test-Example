//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Csongor G. Korosi on 23/03/2021.
//  Copyright © 2021 Csongor Korosi. All rights reserved.
//

import XCTest
import SnapshotTesting

class TutorialViewControllerTests: XCTestCase {
    
    let viewModel = TutorialViewModel()
    let devices: [String: ViewImageConfig] = ["iPhoneX": .iPhoneX,
                                              "iPhone8": .iPhone8,
                                              "iPhoneSe": .iPhoneSe]

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_tutorialViewController_step1_initial() throws {
        viewModel.currentStepIndex = 0
        
        let tutorialVC = TutorialViewController(viewModel: viewModel)
        let _ = devices.map { device in
            assertSnapshot(matching: tutorialVC, as: .image(precision: 1.0))
        }
    }
    
    func test_tutorialViewController_step1_choice1() throws {
        viewModel.currentStepIndex = 0

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 0)

        assertSnapshot(matching: tutorialVC, as: .image)
    }
    
    func test_tutorialViewController_step1_choice2() throws {
        viewModel.currentStepIndex = 0

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 1)

        assertSnapshot(matching: tutorialVC, as: .image)
    }

    
    func test_tutorialViewController_step1_choice3() throws {
        viewModel.currentStepIndex = 0

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 2)

        assertSnapshot(matching: tutorialVC, as: .image)
    }
    
    func test_tutorialViewController_step2_initial() throws {
        viewModel.currentStepIndex = 1
        
        let tutorialVC = TutorialViewController(viewModel: viewModel)
        assertSnapshot(matching: tutorialVC, as: .image)
    }
    
    func test_tutorialViewController_step3_initial() throws {
        viewModel.currentStepIndex = 2
        
        let tutorialVC = TutorialViewController(viewModel: viewModel)
        assertSnapshot(matching: tutorialVC, as: .image)
    }
    
    func test_tutorialViewController_step4_initial() throws {
        viewModel.currentStepIndex = 3
        
        let tutorialVC = TutorialViewController(viewModel: viewModel)
        assertSnapshot(matching: tutorialVC, as: .image(precision: 1.0))
    }
    
    func test_tutorialViewController_step4_choice1() throws {
        viewModel.currentStepIndex = 3

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 0)

        assertSnapshot(matching: tutorialVC, as: .image)
    }
    
    func test_tutorialViewController_step4_choice2() throws {
        viewModel.currentStepIndex = 3

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 1)

        assertSnapshot(matching: tutorialVC, as: .image)
    }

    
    func test_tutorialViewController_step4_choice3() throws {
        viewModel.currentStepIndex = 3

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        viewModel.updateChoice(at: 2)

        assertSnapshot(matching: tutorialVC, as: .image)
    }

    
    func test_tutorialViewController_step5_initial() throws {
        viewModel.currentStepIndex = 4

        let tutorialVC = TutorialViewController(viewModel: viewModel)
        assertSnapshot(matching: tutorialVC, as: .image)
    }
}
