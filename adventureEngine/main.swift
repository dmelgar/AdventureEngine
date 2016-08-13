//
//  main.swift
//  adventureEngine
//
//  Created by Evan on 8/13/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

func run() throws {
    guard let fileData = NSData(contentsOfFile: "/Users/evan/Desktop/story.json"),
        let result = try NSJSONSerialization.JSONObjectWithData(fileData, options: []) as? [String:AnyObject] else {
        return
    }
    var nextNode = 1;
    while nextNode != 0 {
        let nodeData: [String:AnyObject] = result[String(nextNode)] as! [String:AnyObject]
        let node: Node = Node(data: nodeData)
        node.printStory()
        nextNode = node.read()
    }
}

try! run()