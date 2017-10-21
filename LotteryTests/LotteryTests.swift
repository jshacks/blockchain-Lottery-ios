//
//  LotteryTests.swift
//  LotteryTests
//
//  Created by serban chiricescu on 10/21/17.
//  Copyright © 2017 ATeam. All rights reserved.
//

import XCTest

@testable import Lottery
class LotteryTests: XCTestCase {
    
    let sut = Defaults(userDefaults: UserDefaults(suiteName: "sut"))
    
    
    
    override func tearDown() {
        UserDefaults.removeSuite(UserDefaults())
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
