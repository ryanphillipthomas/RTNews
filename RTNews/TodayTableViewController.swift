//
//  TodayTableViewController.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit
import CoreData

class TodayTableViewController: UITableViewController {

    var managedObjectContext:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load data
        loadAllPostsData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -fetchedResultsController
    lazy var fetchedResultsController: NSFetchedResultsController<Post> = {
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        
        // Configure Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    func fetch () {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = fetchedResultsController.fetchedObjects else { return 0 }
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        configure(cell as! PostTableViewCell, at: indexPath)
        return cell
    }
    
    func configure(_ cell: PostTableViewCell, at indexPath: IndexPath) {
        // Fetch Post
        let post = fetchedResultsController.object(at: indexPath)
        cell.configureWith(post: post)
    }
    
    //MARK: - API Calls
    func loadAllPostsData() {
        fetch()
        self.tableView.reloadData()
        //updateView()
        getAllPosts()
    }
    
    func handleRefresh() {
        getAllPosts()
        fetch()
        self.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    func getAllPosts() {
        Post.all(moc: self.managedObjectContext) { (posts, response) in
            self.refreshControl?.endRefreshing()
        }
        
        
//        Student.allWithNextUpcomingSession(moc: self.managedObjectContext) { (students, response) in
//            self.refreshControl.endRefreshing()
//            self.hideLoadingView()
//            switch response.result {
//            case .success:
//                break
//            case .failure(let error):
//                let networkError = APINetworkingError(responseData: response.data, responseError: error)
//                switch networkError.parseNetworkErrorResponse() {
//                case .apiError(let msg):
//                    if let msg = msg { AlertHelper.showAlert(title: msg, controller: self) }
//                case .networkError(let msg):
//                    if let msg = msg { AlertHelper.showAlert(title: msg, controller: self) }
//                case .offlineError(let msg):
//                    if let msg = msg { AlertHelper.showAlert(title: msg, controller: self) }
//                }
//            }
//        }
    }
}

extension TodayTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        //updateView()
    }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case .update:
            if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath) as? PostTableViewCell {
                configure(cell, at: indexPath)
            }
            break;
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
        }
    }
}

