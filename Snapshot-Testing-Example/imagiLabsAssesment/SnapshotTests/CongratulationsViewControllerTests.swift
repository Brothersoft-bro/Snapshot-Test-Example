//
//  CongratulationsViewControllerTests.swift
//  SnapshotTests
//
//  Created by Csongor G. Korosi on 23/03/2021.
//  Copyright © 2021 Csongor Korosi. All rights reserved.
//

import XCTest
import SnapshotTesting

class CongratulationsViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_congratulationsViewController() throws {
        let congratulationsVC = CongratulationsViewController()
        assertSnapshot(matching: congratulationsVC, as: .image)
    }

}
