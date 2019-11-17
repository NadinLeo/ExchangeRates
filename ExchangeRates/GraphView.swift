//
//  GraphView.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/17/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    var rangeTime: Range<Int>
    var line: Line
    var rangeY: Range<Int>?
    var lineWidth: CGFloat = 1
    
    private var minY: Int {rangeY==nil ? line.points[rangeTime].min()! : rangeY!.lowerBound}
    
    private var maxY: Int {rangeY==nil ? line.points[rangeTime].max()! : rangeY!.upperBound}
    
    private var colorGraph: Color{ Color(line.color!) }
    
    var body: some View {
        Grapch(rangeTime: rangeTime, line: line, lowerY: CGFloat(minY), upperY: CGFloat(maxY)).stroke(Color(self.line.color!),lineWidth: self.lineWidth).animation(.linear(duration:0.6))
    }
}

struct GraphView_Previews: PreviewProvider {
    
    static var previews: some View {
        GraphView(rangeTime: 0..<ChartData.chartsData[2].xTime.count, line: ChartData.chartsData[2].lines[0]).frame(height: 500)
    }
}
