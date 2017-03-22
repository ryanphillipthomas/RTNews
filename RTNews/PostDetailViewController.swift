//
//  PostDetailViewController.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/22/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit
import CoreData

class PostDetailViewController: UIViewController {
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PostDetailViewController : PostCell {
    func configureWith(post: Post, moc: NSManagedObjectContext, buttonCallback: ((ButtonCallbackType) -> Void)?) {
        //
    }
}
