//
//  HOption.swift
//  HighChart
//
//  Created by Nouman Pervez on 03/08/23.
//

import Foundation
import Highcharts

class ChartOption {
    
    public func getOption (chartData:ChartData) -> HIOptions {
        
        let options = HIOptions()
        options.yAxis = [chartData.generateYAxis()]
        options.xAxis = [chartData.generateXAxis()]
        options.series = [chartData.generateHSeries(name: "Cappuccino"), chartData.generateHSeries(name: "Latte"), chartData.generateHSeries(name: "Espresso"), chartData.generateHSeries(name: "Green Tea")]
        return options

    }
}
