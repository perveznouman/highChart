//
//  ChartType.swift
//  HighChart
//
//  Created by Nouman Pervez on 18/07/23.
//

import Foundation

public enum ChartType: String {
    case Spline = "spline"
    case Line = "line"
    case Area = "area"
    case AreaSpline = "areaspline"
    case Column = "column"
    case Bar = "bar"
    case Pie = "pie"
    
    // These are not showing any result as of now
    case AreaSplineRange = "areasplinerange"
    case AreaRange = "arearange"
    case Gauge = "gauge"
    case Scatter = "scatter"

}
