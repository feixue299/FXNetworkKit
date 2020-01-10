//
//  PageApiManagerTests.swift
//  FXNetworkKitTests
//
//  Created by Mr.wu on 2020/1/8.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import XCTest
import FXNetworkKit
import Moya

class PageApiManagerTests: XCTestCase {
    
    struct TestContainer: Codable, ContainerProtocol {
        var model: [TestModel]?
        
        typealias Model = [TestModel]
    }
    
    struct TestModel: Codable {
        
    }
    
    class Foo: PageApiManager<APIServer, TestContainer, TestModel> {
        override init(plugins: [PluginType] = []) {
            super.init(plugins: plugins)
        }
        override func requestData(response: (([PageApiManagerTests.TestModel]) -> Void)?) {
            //get
            print("page.page:\(page)")
            print("page.data:\(modelGroup)")
            print("page.pageEnd:\(pageEnd)")
            print("page.pageSize:\(pageSize)")
            
            requestTarget(APIServer(), containerClosure: nil, modelClosure: nil)
        }
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
