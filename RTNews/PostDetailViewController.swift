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
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var body: UILabel!
    
    var post:Post!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureWith(post: post)
    }
    
    func configureWith(post: Post) {
        self.postTitle.text = post.title
        if let body = post.body { self.body.text = body }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSelectClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
