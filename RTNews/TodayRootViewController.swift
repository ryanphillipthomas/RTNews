//
//  TodayRootViewController.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit
import CoreData

class TodayRootViewController: UIViewController {
    var managedObjectContext:NSManagedObjectContext!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var monthDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupHeaderView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todayTableViewControllerEmbed", let todayTableViewController = segue.destination as? TodayTableViewController {
            todayTableViewController.managedObjectContext = self.managedObjectContext
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Top Header View
    func setupHeaderView() {
        dayOfWeekLabel.text = StringHelper.dayOfWeekString(date: Date.init())
        monthDateLabel.text = StringHelper.monthDateString(date: Date.init())

        logoImageView.layer.cornerRadius = 5.0
        logoImageView.clipsToBounds = true
    }
    

}
