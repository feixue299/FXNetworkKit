//
//  Internal.swift
//  HBYModelManagerKit
//
//  Created by Mr.wu on 2019/12/11.
//  Copyright © 2019 Mr.wu. All rights reserved.
//

import Foundation

public class Page<Data> {
    private(set) var page: Int = 1
    public let pageSize: Int = 10
    public internal(set) var pageEnd: Bool = false
    public internal(set) var data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func nextPage() {
        page += 1
    }
}

