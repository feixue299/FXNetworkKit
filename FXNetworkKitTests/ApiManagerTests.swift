//
//  ApiManagerTests.swift
//  FXNetworkKitTests
//
//  Created by Mr.wu on 2020/1/8.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import XCTest
import FXNetworkKit
import Moya

struct APIServer: TargetType {
    var baseURL: URL
    
    var path: String
    
    var method: Moya.Method
    
    var sampleData: Data
    
    var task: Task
    
    var headers: [String : String]?
}

struct Container: Codable, ContainerProtocol {
    var model: String?
    
    typealias Model = String
}

class Foo: ApiManager<APIServer, Container> {
    override func requestData(response: ((String) -> Void)?) {
        
    }
}

class ApiManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
