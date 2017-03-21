//
//  APIManager.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.

import UIKit
import Alamofire

public class APIManager {
    static let baseURL = "https://jsonplaceholder.typicode.com/"
    
    //MARK - Posts
    public class func post(id:String, responseCallback:@escaping(DataResponse<Any>) -> ()){
        let urlString = baseURL + "posts/" + id
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            responseCallback(response)
        }
    }
    
    public class func posts(responseCallback:@escaping(DataResponse<Any>) -> ()){
        let urlString = baseURL + "posts"
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            responseCallback(response)
        }
    }
}
