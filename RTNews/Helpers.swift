//
//  Helpers.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit
import CoreData

// MARK: - Root helper
class RootHelper{
    // Set root controller
    class func setRootController(window: UIWindow?, storyboardName: String, viewControllerID: String, moc: NSManagedObjectContext){
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        window?.rootViewController = storyBoard.instantiateViewController(withIdentifier: viewControllerID)
        setMOCController(window: window, moc: moc)
    }
    
    class func setMOCController(window: UIWindow?, moc: NSManagedObjectContext){
        if let vc = window?.rootViewController as? TodayRootViewController { // Controller
            vc.managedObjectContext = moc
        }
    }
}

class StringHelper {
    class func dayOfWeekString(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    class func monthDateString(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: date)
    }
}
