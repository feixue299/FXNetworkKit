//
//  NetworkLogPlugin.swift
//  PublicSecurityAPIKit
//
//  Created by Mr.wu on 2020/1/7.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import Foundation
import Moya

public struct NetworkLogPlugin: PluginType {
    
    public init() { }
    
    public func willSend(_ request: RequestType, target: TargetType) {
        print("==================request=====================")
        print("url:\(String(describing: request.request?.url))")
        print("==================request=====================")
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print("==================response==================")
        switch result {
        case .success(let resp):
            print("value:\(String(describing: try? resp.mapJSON()))")
        case .failure(let error):
            print("failure.error:\(error.localizedDescription)")
        }
        print("==================response==================")
    }
    
}
