//
//  HomeViewController.swift
//  HighChart
//
//  Created by Nouman Pervez on 15/07/23.
//

import UIKit
import Highcharts

class HomeViewController: UIViewController {
    
    private var hChartView: HIChartView!
    private let chartType: String = ChartType.Spline.rawValue
    private var selectedSegmentIdx = 0
    private var options = HIOptions()
    private var hChartData: ChartData!
    
    lazy var chartContainerView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let s = UISegmentedControl(items: ["Weekly", "Monthly", "Yearly"])
        s.selectedSegmentIndex = 0
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createChart()
    }
    
    private func createSubView() {
        
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        view.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.topAnchor.constraint(equalTo:view.topAnchor, constant: 60).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(chartContainerView)
        chartContainerView.translatesAutoresizingMaskIntoConstraints = false
        chartContainerView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10).isActive = true
        chartContainerView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -5).isActive = true
        chartContainerView.heightAnchor.constraint(equalToConstant:400).isActive = true
        chartContainerView.topAnchor.constraint(equalTo:segmentControl.topAnchor, constant: 60).isActive = true

    }
    
    private func createChart() {
        hChartView = HIChartView(frame: chartContainerView.bounds)
        
        let chart = HIChart()
        chart.type = chartType
        
        let cTitle = HITitle()
        cTitle.text = "Coffee Day sales"
        hChartData = ChartData(type: .Week)

        options.title = cTitle
        options.chart = chart
        
        options = ChartOption().getOption(chartData: hChartData)
        hChartView.options = options
        chartContainerView.addSubview(hChartView)
        selectedSegmentIdx = 0
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        if(idx == selectedSegmentIdx) {
            return
        }
        selectedSegmentIdx = idx
        switch idx {
        case 0:
            hChartView.options = reloadData(.Week)
        case 1:
            hChartView.options = reloadData(.Month)
        case 2:
            hChartView.options = reloadData(.Year)
        default:
            break
        }
        hChartView.redraw()
        
    }
    
    private func reloadData(_ type: XPlotType) -> HIOptions {
        
        hChartData.setPlotType(type: type)
        options = ChartOption().getOption(chartData: hChartData)
        return options
    }
    
    
}
