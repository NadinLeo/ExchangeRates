//
//  Downloadable.swift
//  PhotoDownloder
//
//  Created by Nadzeya Leanovich on 11/10/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

protocol Downloadable {
    func getData(by url:String, callback: @escaping(_ data: Data) -> ())
}
