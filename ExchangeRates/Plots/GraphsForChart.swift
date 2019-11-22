//
//  GraphsForChart.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/17/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

func rangeOfRanges<C:Collection>(_ ranges:C)->Range<Int> where C.Element == Range<Int> {
    guard !ranges.isEmpty else {return 0..<1}
    let low = ranges.lazy.map{$0.lowerBound}.min()!
    let hight = ranges.lazy.map{$0.upperBound}.max()!
    return low..<hight
}

struct GraphsForChart: View {
    var chart: LinesSet
    var rangeTime: Range<Int>
    var lineWidth: CGFloat = 2
    
    private var rangeY: Range<Int> {
        let rangeY = rangeOfRanges(chart.lines.filter{!$0.isHidden}.map{$0.points[rangeTime].min()!..<$0.points[rangeTime].max()!})
        return rangeY == 0..<0 ? 0..<1 : rangeY
    }
    
    var body: some View {
        ZStack {
            ForEach (chart.lines.filter{!$0.isHidden}) { line in
                GraphView(rangeTime: self.rangeTime, line: line, rangeY: self.rangeY, lineWidth: self.lineWidth).transition(.move(edge: .top))
            }
        }.drawingGroup()
    }
    
    
}

struct GraphsForChart_Previews: PreviewProvider {
    static var previews: some View {
        GraphsForChart(chart: ChartData.chartsData[2], rangeTime: 0..<ChartData.chartsData[2].xTime.count-1, lineWidth: 2)
    }
}
