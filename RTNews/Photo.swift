//
//  Photo.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.

import UIKit
import CoreData
import RTCoreData
import Alamofire
import Foundation

public class Photo: ManagedObject {
    
    //MARK Properties
    @NSManaged public private(set) var id:Int64
    @NSManaged public private(set) var url:String?
    
    // MARK: removeAllPhotos
    public static func removeAllImages(moc : NSManagedObjectContext) {
        let photosToRemove = fetchInContext(context: moc)
        
        // Loop and delete all photos
        for photo in photosToRemove {
            print("Removing photo %@", photo.id)
            moc.delete(photo)
        }
        _ = moc.saveOrRollback()
    }
    
    // MARK: insertIntoContext
    public static func insertIntoContext(moc: NSManagedObjectContext, photoDictionary:NSDictionary) -> Photo? {
        guard let id = photoDictionary["id"] as? Int64,
        let url = photoDictionary["url"] as? String
            else {
                return nil
        }
        
        let predicate = NSPredicate(format: "id == %i", id)
        
        let photo = Photo.findOrCreateInContext(moc: moc, matchingPredicate: predicate) { (photo) in
            photo.id = id
            photo.url = url
    }
        
        return photo
    }
    
    // MARK: get all photos
    public static func all(moc: NSManagedObjectContext, responseCallback:@escaping([Photo]?, DataResponse<Any>) -> ()){
        APIManager.photos(responseCallback: { (response) in
        guard let photos = response.result.value as? NSArray else { return responseCallback(nil, response)}
            var photosArray:[Photo] = []
            for photoDictionary in photos {
                if let photoDictionary = photoDictionary as? NSDictionary, let photo = Photo.insertIntoContext(moc: moc, photoDictionary: photoDictionary) {
                    photosArray.append(photo)
                }
            }
            _ = moc.saveOrRollback()
            responseCallback(photosArray, response)
        })
    }
}

extension Photo: ManagedObjectType {
    public static var entityName: String {
        return "Photo"
    }
    
    public static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: "id", ascending: true)]
    }
}

