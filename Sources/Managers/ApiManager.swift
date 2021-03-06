//
//  ApiManager.swift
//  FXNetworkKit
//
//  Created by Mr.wu on 2020/1/8.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import Foundation
import Moya

open class ApiManager<Target: TargetType, Container: ContainerProtocol & Codable> where Container.Model: Codable {
    
    private(set) var isNetworking: Bool = false
    
    private(set) lazy var network: MoyaProvider<Target> = {
        let ps: [PluginType] = [self, NetworkLogPlugin()]
        self.plugins.append(contentsOf: ps)
        return MoyaProvider<Target>(plugins: self.plugins)
    }()
    
    private var plugins: [PluginType]
    
    public init(plugins: [PluginType] = []) {
        self.plugins = plugins
    }
    
    public func requestTarget(_ target: Target, containerClosure:((Container) -> Void)? = nil, modelClosure: ((Container.Model?) -> Void)? = nil) {
        guard !isNetworking else { return }
        network.request(target) { result in
            if case let .success(resp) = result {
                do {
                    print("resp.data:\(try resp.mapJSON())")
                    let model = try JSONDecoder().decode(Container.self, from: resp.data)
                    print("success.model:\(model)")
                    containerClosure?(model)
                    modelClosure?(model.model)
                } catch {
                    print("try.error:\(error)")
                }
            }
        }
    }
    
    open func requestData(response: ((Container.Model) -> Void)?) { }
    
}

extension ApiManager: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        isNetworking = true
        
        return request
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        isNetworking = false
    }
}
