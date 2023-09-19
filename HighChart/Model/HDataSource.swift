//
//  HDataSource.swift
//  HighChart
//
//  Created by Nouman Pervez on 16/07/23.
//

import Foundation
import Highcharts


class ChartData {
        
    var plotType: XPlotType
    init(type: XPlotType) {
        plotType = type
    }
    
    public func setPlotType(type: XPlotType) {
        plotType = type
    }
    
    public func generateHSeries(name: String = "") -> HISeries {
        let series = HISeries()
        series.data = plotData()
        series.type = ChartType.Spline.rawValue
        series.name = name
        series.color =  HIColor(uiColor: .random)
        return series
    }
   
    public func generateYAxis() -> HIYAxis {
        let yAxis = HIYAxis()
        yAxis.tickInterval = yAxisInterval()
        yAxis.type = "linear"
        yAxis.title = HITitle()
        yAxis.title.text = plotType.rawValue + "ly Sales"
        return yAxis
    }

    public func generateXAxis() -> HIXAxis {
        let xAxis = HIXAxis()
        xAxis.categories = xAxisCategory()
        xAxis.title = HITitle()
        xAxis.title.text = ""
        return xAxis
    }
    
    private func yAxisInterval() -> NSNumber {
        var interval = 0
        switch(plotType) {
        case .Week:
            interval = 200
        case .Month:
            interval = 2000
        case .Year:
            interval = 20000
        }
        return NSNumber(value: interval)
    }
    
    private func xAxisCategory() -> [String] {
        var data: [String]!
        switch(plotType) {
        case .Week:
            data = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
        case .Month:
            data = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        case .Year:
            data = ["2023", "2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014"]
        }
        return data
    }
    
    private func plotData () -> [Int] {
        var data: [Int]!
        switch plotType {
        case .Week:
            data = (1...7).map( {_ in Int.random(in: 1...1000)} )
        case .Month:
            data = (1...12).map( {_ in Int.random(in: 1...10000)} )
        case .Year:
            data = (1...10).map( {_ in Int.random(in: 1...100000)} )
        }
        return data
    }
    
}
