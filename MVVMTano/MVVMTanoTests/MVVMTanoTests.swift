//
//  MVVMTanoTests.swift
//  MVVMTanoTests
//
//  Created by admin on 2/2/21.
//

import XCTest
@testable import MVVMTano

class MVVMTanoTests: XCTestCase {
    
    // MARK : - Tests
    
    var list: List?
    var listViewModel: ViewModelList?

    override func setUpWithError() throws {
        list = List(userId: 0, id: 0, title: "My Title", body: "My Text Body")
        listViewModel = ViewModelList()
    }

    override func tearDownWithError() throws {
        list = nil
        listViewModel = nil
    }
    
    // MARK : - Tests
    
    func testViewModelList() {
        guard let list = self.list else {
            XCTFail("list invalid")
            return
        }
        
        listViewModel?.dataArray = [list]
        XCTAssertNotNil(listViewModel, "listViewModel is invalid")
        
        guard let item = listViewModel?.dataArray.first else {
            XCTFail("listViewModel invalid item")
            return
        }
        
        XCTAssertEqual(listViewModel?.dataArray.count, 1, "should be 1")
        XCTAssertEqual(list.title, item.title)
    }
}
