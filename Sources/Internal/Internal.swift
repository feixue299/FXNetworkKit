//
//  Internal.swift
//  HBYModelManagerKit
//
//  Created by Mr.wu on 2019/12/11.
//  Copyright © 2019 Mr.wu. All rights reserved.
//

import Foundation

class Page<Data> {
    private(set) var page: Int = 1
    let pageSize: Int = 10
    var pageEnd: Bool = false
    var data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func nextPage() {
        page += 1
    }
}

