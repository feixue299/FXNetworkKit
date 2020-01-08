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
    var baseURL: URL = URL(string: "")!
    
    var path: String = ""
    
    var method: Moya.Method = .post
    
    var sampleData: Data = Data()
    
    var task: Task = .requestPlain
    
    var headers: [String : String]?
}

struct Container: Codable, ContainerProtocol {
    var model: String?
    
    typealias Model = String
}

class Foo: ApiManager<APIServer, Container> {
    override init(plugins: [PluginType] = []) {
        super.init(plugins: plugins)
    }
    
    override func requestData(response: ((String) -> Void)?) {
        super.requestTarget(APIServer(), containerClosure: nil, modelClosure: nil)
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
