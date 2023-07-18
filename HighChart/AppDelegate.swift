//
//  AppDelegate.swift
//  HighChart
//
//  Created by Nouman Pervez on 15/07/23.
//

import UIKit
import Highcharts

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        HIChartView.preload()
        return true
    }

}

