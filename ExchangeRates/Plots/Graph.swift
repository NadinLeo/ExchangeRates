//
//  Graph.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/17/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct Grapch: Shape {
    var rangeTime: Range<Int>
    var line: Line
    var lowerY: CGFloat
    var upperY: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
           get { AnimatablePair(lowerY, upperY) }
           set {
               lowerY = newValue.first
               upperY = newValue.second
           }
       }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
               let width: CGFloat = rect.size.width
               let scale = rect.size.height / (upperY - lowerY)
               let origin = CGPoint(x:0, y: rect.size.height)
               let step = (width - origin.x)/CGFloat(self.rangeTime.count - 1)
        path.addLines(Array(rangeTime.lowerBound..<rangeTime.upperBound).map{CGPoint(x: origin.x + CGFloat($0 - rangeTime.lowerBound)*step, y: origin.y - (CGFloat(line.points[$0]) - self.lowerY)*scale)})
               
               return path
    }
    
}
