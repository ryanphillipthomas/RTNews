//
//  Post.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.

import UIKit
import CoreData
import RTCoreData
import Alamofire
import Foundation

public class Post: ManagedObject {
    
    //MARK Properties
    @NSManaged public private(set) var id:Int64
    @NSManaged public private(set) var userId:Int64
    @NSManaged public private(set) var title:String?
    @NSManaged public private(set) var body:String?
    
    // MARK: removeAllPosts
    public static func removeAllPosts(moc : NSManagedObjectContext) {
        let postsToRemove = fetchInContext(context: moc)
        
        // Loop and delete all posts
        for post in postsToRemove {
            print("Removing post %@", post.id)
            moc.delete(post)
        }
        _ = moc.saveOrRollback()
    }
    
    // MARK: insertIntoContext
    public static func insertIntoContext(moc: NSManagedObjectContext, postDictionary:NSDictionary) -> Post? {
        guard let id = postDictionary["id"] as? Int64,
        let userId = postDictionary["userId"] as? Int64
            else {
                return nil
        }
        
        let predicate = NSPredicate(format: "id == %i", id)
        
        let post = Post.findOrCreateInContext(moc: moc, matchingPredicate: predicate) { (post) in
            post.id = id
            post.userId = userId
            post.body = postDictionary["body"] as? String
            post.title = postDictionary["title"] as? String

// DEV TODO Create relationships
//         let userPredicate = NSPredicate(format: "id == %@", userId)
//         let user = User.findOrFetchInContext(moc: moc, matchingPredicate: userPredicate)
//           if let user = user {
//            post.user = user
//          }

    }
        
        return post
    }
    
    // MARK: get all posts
    public static func all(moc: NSManagedObjectContext, responseCallback:@escaping([Post]?, DataResponse<Any>) -> ()){
        APIManager.posts(responseCallback: { (response) in
        guard let posts = response.result.value as? NSArray else { return responseCallback(nil, response)}
            var postsArray:[Post] = []
            for postDictionary in posts {
                if let postDictionary = postDictionary as? NSDictionary, let post = Post.insertIntoContext(moc: moc, postDictionary: postDictionary) {
                    postsArray.append(post)
                }
            }
            _ = moc.saveOrRollback()
            responseCallback(postsArray, response)
        })
    }
}

extension Post: ManagedObjectType {
    public static var entityName: String {
        return "Post"
    }
    
    public static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: "id", ascending: true)]
    }
}

