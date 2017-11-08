//
//  AppDelegate.swift
//  ApolloGraphClientDemo
//
//  Created by Danh Dang on 11/1/17.
//  Copyright © 2017 Danh Dang. All rights reserved.
//

import UIKit
import Apollo

//let graphQLEndPoint = "https://api.staging.hk.zalora.net/v1/graphql"
let graphQLEndPoint = "http://localhost:3000"
let apollo = ApolloClient(url: URL(string: graphQLEndPoint)!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["Id"] }
        return true
    }
}

