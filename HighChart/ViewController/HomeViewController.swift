//
//  HomeViewController.swift
//  HighChart
//
//  Created by Nouman Pervez on 15/07/23.
//

import UIKit
import Highcharts

class HomeViewController: UIViewController {
    
    var hChartView: HIChartView!
    let chartType: String = ChartType.Spline.rawValue
    
    lazy var chartContainerView: UIView = {
        let v = UIView()
        return v
    }()
    
    var testV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createChart()
    }
    
    private func createSubView() {
        view.addSubview(chartContainerView)
        chartContainerView.translatesAutoresizingMaskIntoConstraints = false
        chartContainerView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10).isActive = true
        chartContainerView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -5).isActive = true
        chartContainerView.heightAnchor.constraint(equalToConstant:400).isActive = true
        chartContainerView.topAnchor.constraint(equalTo:view.topAnchor, constant: 60).isActive = true

    }
    
    private func createChart() {
        hChartView = HIChartView(frame: chartContainerView.bounds)
        
        let chart = HIChart()
        chart.type = chartType
        
        let cTitle = HITitle()
        cTitle.text = "Coffee Day sales"
        let hChartData = HChartData()

        let options = HIOptions()
        options.title = cTitle
        options.chart = chart
        options.series = [hChartData.generateHSeries(name: "Cappuccino"), hChartData.generateHSeries(name: "Latte"), hChartData.generateHSeries(name: "Espresso"), hChartData.generateHSeries(name: "Green Tea"), hChartData.generateHSeries(name: "Ginger Tea")]
        options.yAxis = [hChartData.generateYAxis()]
        options.xAxis = [hChartData.generateXAxis()]

        hChartView.options = options
        chartContainerView.addSubview(hChartView)

    }
    
    
}
