//
//  SwiftCalcUITests.swift
//  SwiftCalcUITests
//
//  Created by Tiago Silva on 03/10/2022.
//

import XCTest

final class SwiftCalcUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPressMemoryPlusAtAppStartShowZeroInDisplay() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssert(displayText == "0")
    }
    
    func testAddingTwoDigits() {
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        
        let addButton = app.buttons["+"]
        addButton.tap()
        
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let equalButton = app.buttons["="]
        equalButton.tap()
        
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssert(displayText == "8.0")
    }
    
    #if !targetEnvironment(macCatalyst)
    func testSwipeToClearMemory() {
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let memoryDisplay = app.staticTexts["memoryDisplay"]
        XCTAssert(memoryDisplay.exists)
        
        #if targetEnvironment(macCatalyst)
        memoryDisplay.doubleTap()
        #else
        memoryDisplay.swipeLeft()
        #endif
        XCTAssertFalse(memoryDisplay.exists)
    }
    #endif

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
