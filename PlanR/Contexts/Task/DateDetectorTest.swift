//
//  DateDetectorTest.swift
//  PlanRTests
//
//  Created by Aisyah Dzulqaidah on 29/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import XCTest
@testable import PlanR

class DateDetectorTest: XCTestCase {

    func testWhenThereIsHariIniInTextShouldDetectedAsDate() {
        let text = "Saya mau makan hari ini"
        XCTAssertEqual(text.isContainingToday(), true)
        
        let text2 = "Hari ini pergi"
        XCTAssertEqual(text2.isContainingToday(), true)
        
        let text3 = "mungkin hari ini akan pergi"
        XCTAssertEqual(text3.isContainingToday(), true)
        
        let text4 = "hari dia ini"
        XCTAssertEqual(text4.isContainingToday(), false)
        
        let text5 = "i want to do it today"
        XCTAssertEqual(text5.isContainingToday(), true)
        
        let text6 = "i want to day do it"
        XCTAssertEqual(text6.isContainingToday(), false)

    }
    
    func testWhenThereIsHariIniInTextShouldReturnTodayDate() {
        
        let text1 = "Hari ini mau makan"
//        XCTAssertLessThan(text1.convertToDate().timeIntervalSinceNow, 0)
//        XCTAssertGreaterThan(text1.convertToDate().timeIntervalSinceNow, -10)
        XCTAssertEqual(text1.convertToDate().timeIntervalSinceNow, Date().timeIntervalSinceNow, accuracy: 0.1)
        
        
    }


}
