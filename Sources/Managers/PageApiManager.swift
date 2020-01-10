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
    
    private var internalPage: Page<Container.Model> = Page(data: [])
    public var page: Int {
        return internalPage.page
    }
    public var pageSize: Int {
        return internalPage.pageSize
    }
    public var pageEnd: Bool {
        return internalPage.pageEnd
    }
    public var modelGroup: Container.Model {
        return internalPage.data
    }
    
    override public func requestTarget(_ target: Target, containerClosure:((Container) -> Void)? = nil, modelClosure: ((Container.Model?) -> Void)? = nil) {
        super.requestTarget(target, containerClosure: containerClosure) { (modelGroup) in
            if let modelGroup = modelGroup {
                self.internalPage.data.append(contentsOf: modelGroup)
                if modelGroup.count < self.internalPage.pageSize {
                    self.internalPage.pageEnd = true
                }
            } else {
                self.internalPage.pageEnd = true
            }
            modelClosure?(self.internalPage.data)
        }
        internalPage.nextPage()
    }

    open override func requestData(response: ((Container.Model) -> Void)?) { }
}
