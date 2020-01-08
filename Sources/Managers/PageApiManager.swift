//
//  PageApiManager.swift
//  FXNetworkKit
//
//  Created by Mr.wu on 2020/1/8.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import Foundation
import Moya

open class PageApiManager<Target: TargetType, Container: ContainerProtocol & Codable, Model: Codable>: ApiManager<Target, Container> where Container.Model == Array<Model> {
    
    public private(set) var page: Page<Container.Model> = Page(data: [])
    public var pageEnd: Bool {
        return page.pageEnd
    }
    public var modelGroup: Container.Model {
        return page.data
    }
    
    override public func requestTarget(_ target: Target, containerClosure:((Container) -> Void)? = nil, modelClosure: ((Container.Model?) -> Void)? = nil) {
        super.requestTarget(target, containerClosure: containerClosure) { (modelGroup) in
            if let modelGroup = modelGroup {
                self.page.data.append(contentsOf: modelGroup)
                self.dataAppended()
                if modelGroup.count < self.page.pageSize {
                    self.page.pageEnd = true
                }
            } else {
                self.page.pageEnd = true
            }
            modelClosure?(self.page.data)
        }
        page.nextPage()
    }

    open override func requestData(response: ((Container.Model) -> Void)?) { }
    func dataAppended() { }
}
