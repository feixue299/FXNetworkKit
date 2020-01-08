//
//  ContainerProtocol.swift
//  FXNetworkKit
//
//  Created by Mr.wu on 2020/1/8.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import Foundation

public protocol ContainerProtocol {
    associatedtype Model
    var model: Model? { get }
}
