//
//  Artistry.swift
//  Artistry
//
//  Created by 牧易 on 17/7/12.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit


struct Artist {
    let name:String?
    let bio:String?
    let image:UIImage?
    let works:[Work]
    
    
    
    
    static func getArtistsFromRes() -> [Artist]{
        
        var artists:[Artist] = []
        
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artists
        }
        do{
            let data = try Data(contentsOf: url)
            guard let rootJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]  else {
                return artists
            }
            
            guard let artistJsons = rootJson["artists"] as? [[String:Any]] else {
                return artists
            }
            
            for artistJson in artistJsons {
                
                let name = artistJson["name"] as? String
                let bio = artistJson["bio"] as? String
                let imageName = artistJson["image"] as? String
                let wortsObject = artistJson["work"] as? [[String:Any]]
                var works:[Work] = []
                for workObject in wortsObject! {
                    let title = workObject["title"] as? String
                    let workImage = workObject["image"] as? String
                    let info = workObject["info"] as? String
                    
                    let work = Work(title: title, image: UIImage.init(named: workImage!), info: info)
                    works.append(work)
                }
                
                let artist = Artist(name: name, bio: bio, image: UIImage.init(named: imageName!), works: works)
                artists.append(artist)
            }

            
        }catch{
            return artists
        }
        
        
        return artists
    }
    
}
