//
//  AppDelegate.swift
//  TableForm
//
//  Created by Gazolla on 25/07/16.
//  Copyright © 2016 Gazolla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let name = Field(name: "name", cellType: NameCell.self)
        let address = Field(name: "address", cellType: TextCell.self)
        let birth = Field(name: "birthday", cellType: DateCell.self)
        let sectionPersonal = [name, address, birth]
        
        let company = Field(name: "company", cellType: NameCell.self)
        let position = Field(name: "position", cellType: TextCell.self)
        let phonecompany = Field(name: "phone", cellType: PhoneCell.self)
        let sectionProfessional = [company, position, phonecompany]
        
        let save = Field(name: "Save", cellType: ButtonCell.self)
        let sectionButton = [save]
        
        let sections = [sectionPersonal, sectionProfessional, sectionButton]
        
        let config = ConfigureTable(items: sections) { (tableView, indexPath) in
            
            let cell = tableView.tableView.cellForRowAtIndexPath(indexPath)
            if cell is ButtonCell {
                cell?.selected = false
                let dic = tableView.getFormData()
                print(dic)
            }
            
        }
        
        let main = TableViewController(config:config)
        main.title = "Form"
        
        let nav = UINavigationController(rootViewController: main)
        self.window!.rootViewController = nav
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

