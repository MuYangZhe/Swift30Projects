//
//  XMLParser.swift
//  SimpleRSSReader
//
//  Created by 牧易 on 17/7/18.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

struct Item {
    let title:String?
    let date:String?
    let desc:String?
}

class ParserUtil: NSObject,XMLParserDelegate {
    var items:[Item] = []
    var currentTagName = "" {
        didSet{
            currentTagName = currentTagName.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    var currentTitle = "" {
        didSet{
            currentTitle = currentTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    var currentDesc = "" {
        didSet{
            currentDesc = currentDesc.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    var currentDate = "" {
        didSet{
            currentDate = currentDate.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    
    fileprivate var parserCompletionHandler:(([Item]) -> Void)?
    
    
    func startParser(xmlUrl:String,competionHandler:(([Item]) -> Void)?){
        
        self.parserCompletionHandler = competionHandler
        guard let url = URL.init(string: xmlUrl) else {
            print("url error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }.resume()
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        items.removeAll()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("error-- \(parseError)")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentTagName = elementName
        if currentTagName == "item" {
            currentTitle = ""
            currentDesc = ""
            currentDate = ""
            
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentTagName {
        case "title":
            currentTitle += string
        case "description":
            currentDesc += string
        case "pubDate":
            currentDate += string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            items.append(Item.init(title: currentTitle, date: currentDate, desc: currentDesc))
        }
        currentTagName = ""
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        
        self.parserCompletionHandler?(items)
    }
    
    
}



