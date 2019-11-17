//
//  Data.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/8/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import UIKit

struct ChartData {
    
    static var columns: Chart = load("chart_data.json")
    static var chartsData: Lines = addID( charts: columns.compactMap { convertToInternalModel($0)})
    
    static func load<T: Decodable>(_ fileName: String) -> T {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Could not be found file \(fileName) in main bundle.")
        }
        
        let data: Data
        
        do {
            data = try Data(contentsOf: file)
        }
        catch {
            fatalError("File can't be load from main bundle, error - \(error.localizedDescription)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
        catch {
            fatalError("Could not be parse \(fileName) to type \(Chart.self), error - \(error.localizedDescription)")
        }
    }
    
    static func addID(charts : [LinesSet] ) -> [LinesSet] {
        var i = 0
        var newCharts = [LinesSet]()
        for chart in charts {
            var newChart = chart
            newChart.id = i
            newChart.lowerBound = 0.3
            newChart.upperBound = 0.8
            newCharts.append(newChart)
            i += 1
        }
        return newCharts
    }
    
    static func convertToInternalModel(_ chart: ChartElement) -> LinesSet {
        var nameLine = ""
        var values = [Int]()
        var graph = LinesSet(id: 1)
        var lines = [Line]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM d yyyy")
        
        for line in chart.columns {
            for element in line {
                switch element {
                case .integer(let value):
                    values.append(value)
                case .string(let name):
                    nameLine = name
                }
            }
            
            switch nameLine {
            case "x":
                graph.namex = "x"
                graph.xTime = values.map{ dateFormatter.string(
                    from:Date(timeIntervalSince1970: TimeInterval($0/1000))
                    )}
            case "y0":
                lines.append(Line(id: lines.count,
                                  title: chart.names.y0,
                                  points: values,
                                  color: chart.colors.y0.hexStringToUIColor(),
                                  isHidden: false,
                                  type: chart.types.y0,
                                  countY: values.count))
            case "y1":
                lines.append(Line(id: lines.count,
                                  title: chart.names.y1,
                                  points: values,
                                  color: chart.colors.y1.hexStringToUIColor(),
                                  isHidden: false,
                                  type: chart.types.y1,
                                  countY: values.count))
            case "y2":
                lines.append(Line(id: lines.count,
                                  title: chart.names.y2!,
                                  points: values,
                                  color: chart.colors.y2!.hexStringToUIColor(),
                                  isHidden: false,
                                  type: chart.types.y2!,
                                  countY: values.count))
            case "y3":
                lines.append(Line(id: lines.count,
                                  title: chart.names.y3!,
                                  points: values,
                                  color: chart.colors.y3!.hexStringToUIColor(),
                                  isHidden: false,
                                  type: chart.types.y3!,
                                  countY: values.count))
            default: break
            }
            
            nameLine = ""
            values = [Int]()
        }
        
        graph.colorX = chart.colors.x != nil ? chart.colors.x!.hexStringToUIColor() : nil
        graph.lines = lines
        return graph
    }
}
