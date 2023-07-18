//
//  HDataSource.swift
//  HighChart
//
//  Created by Nouman Pervez on 16/07/23.
//

import Foundation
import Highcharts


class HChartData {
        
    init() { }
    
    public func generateHSeries(name: String = "") -> HISeries {
        let series = HISeries()
        series.data = HChartData().plotData()
        series.type = ChartType.Spline.rawValue
        series.name = name
        series.color =  HIColor(uiColor: .random)
        return series
    }
   
    public func generateYAxis() -> HIYAxis {
        let yAxis = HIYAxis()
        yAxis.tickInterval = 200
        yAxis.type = "linear"
        yAxis.title = HITitle()
        yAxis.title.text = "Sales"
        return yAxis
    }

    public func generateXAxis() -> HIXAxis {
        let xAxis = HIXAxis()
        xAxis.categories = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
        xAxis.title = HITitle()
        xAxis.title.text = ""
        return xAxis
    }
    
    private func plotData () -> [Int] {
        (1...7).map( {_ in Int.random(in: 1...1000)} )
    }
    
}
