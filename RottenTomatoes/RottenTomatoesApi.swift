//
//  RottenTomatoesApi.swift
//  RottenTomatoes
//
//  Created by Tommy Chheng on 8/26/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import Foundation
import AFNetworking

struct Movie {
    var id:String
    var critics_consensus:String
    var mpaa_rating:String
    var posters:[String]
    var synopsis:String
    var title:String
    var year:Int
}
//{
//    "abridged_cast": [
//    {
//    "characters": [
//    "Dominic Toretto"
//    ],
//    "id": "162652472",
//    "name": "Vin Diesel"
//    },
//    {
//    "characters": [
//    "Brian O'Conner"
//    ],
//    "id": "162654234",
//    "name": "Paul Walker"
//    },
//    {
//    "characters": [
//    "Louie Tran"
//    ],
//    "id": "162684066",
//    "name": "Tony Jaa"
//    },
//    {
//    "characters": [
//    "Deckard Shaw"
//    ],
//    "id": "162653720",
//    "name": "Jason Statham"
//    },
//    {
//    "characters": [
//    "Luke Hobbs"
//    ],
//    "id": "770893686",
//    "name": "Dwayne \"The Rock\" Johnson"
//    }
//    ],
//    "alternate_ids": {
//        "imdb": "2820852"
//    },
//    "critics_consensus": "",
//    "id": "771354922",
//    "links": {
//        "alternate": "http://www.rottentomatoes.com/m/furious_7/",
//        "cast": "http://api.rottentomatoes.com/api/public/v1.0/movies/771354922/cast.json",
//        "reviews": "http://api.rottentomatoes.com/api/public/v1.0/movies/771354922/reviews.json",
//        "self": "http://api.rottentomatoes.com/api/public/v1.0/movies/771354922.json",
//        "similar": "http://api.rottentomatoes.com/api/public/v1.0/movies/771354922/similar.json"
//    },
//    "mpaa_rating": "PG-13",
//    "posters": {
//        "detailed": "http://resizing.flixster.com/pVDoql2vCTzNNu0t6z0EUlE5G_c=/51x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/14/11181482_ori.jpg",
//        "original": "http://resizing.flixster.com/pVDoql2vCTzNNu0t6z0EUlE5G_c=/51x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/14/11181482_ori.jpg",
//        "profile": "http://resizing.flixster.com/pVDoql2vCTzNNu0t6z0EUlE5G_c=/51x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/14/11181482_ori.jpg",
//        "thumbnail": "http://resizing.flixster.com/pVDoql2vCTzNNu0t6z0EUlE5G_c=/51x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/14/11181482_ori.jpg"
//    },
//    "ratings": {
//        "audience_rating": "Upright",
//        "audience_score": 88,
//        "critics_rating": "Certified Fresh",
//        "critics_score": 82
//    },
//    "release_dates": {
//        "theater": "2015-04-03"
//    },
//    "runtime": 140,
//    "synopsis": "Continuing the global exploits in the unstoppable franchise built on speed, Vin Diesel, Paul Walker and Dwayne Johnson lead the returning cast of Fast & Furious 7. James Wan directs this chapter of the hugely successful series that also welcomes back favorites Michelle Rodriguez, Jordana Brewster, Tyrese Gibson, Chris \"Ludacris\" Bridges, Elsa Pataky and Lucas Black. They are joined by international action stars new to the franchise including Jason Statham, Djimon Hounsou, Tony Jaa, Ronda Rousey and Kurt Russell.",
//    "title": "Furious 7",
//    "year": 2015
//},

class RottenTomatoesApi {
    let manager = AFHTTPSessionManager(baseURL: NSURL(string: "https://gist.githubusercontent.com"))
    
    init() {
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()

        manager.responseSerializer.acceptableContentTypes =  NSSet(object: "text/plain") as Set<NSObject>
    }

    func getBoxOffice(success:NSArray -> (), errorCallback: NSError -> () ) {
        let path = "/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json"
        
        manager.GET(path, parameters: [],
            success: { (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                let movieData = responseObject as! NSDictionary
                let movies = movieData["movies"] as! NSArray
                
                success(movies)
            },
            failure: { (task: NSURLSessionDataTask!, error: NSError!) in
                println(error)
                
                errorCallback(error)
            }
        )
    }
    
    func getTopDVDs(success:NSArray -> (), errorCallback: NSError -> () ) {
        let path = "/timothy1ee/e41513a57049e21bc6cf/raw/b490e79be2d21818f28614ec933d5d8f467f0a66/gistfile1.json"
        
        manager.GET(path, parameters: [],
            success: { (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
                let movieData = responseObject as! NSDictionary
                let movies = movieData["movies"] as! NSArray
                
                success(movies)
            },
            failure: { (task: NSURLSessionDataTask!, error: NSError!) in
                println(error)
                
                errorCallback(error)
            }
        )
    }
    
    class func correctHighResImageUrl(url:String) -> String {
        var workUrl = url
        var range = workUrl.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
        if let range = range {
            workUrl = workUrl.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
        }
        
        return workUrl
    }
}