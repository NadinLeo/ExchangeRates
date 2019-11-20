//
//  Downloader.swift
//  PhotoDownloder
//
//  Created by Nadzeya Leanovich on 11/10/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation


struct Downloader: Downloadable {
    static let shared: Downloadable = Downloader()
    
    private init () {}
    
    func getData(by url: String, callback: @escaping(_ data: Data) -> ()) {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request){[callback] (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            callback(data)
        }
        
        task.resume()
    }
}
