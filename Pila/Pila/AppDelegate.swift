//
//  AppDelegate.swift
//  Pila
//
//  Created by Julia Nikitina on 05/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: Coordinator?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        window?.rootViewController = nav
        let factory = ModuleFactory()
        coordinator = Coordinator(router: nav, factory: factory)
        window?.makeKeyAndVisible()
        coordinator?.start()
        
    }
}

