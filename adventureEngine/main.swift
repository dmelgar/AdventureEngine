//
//  main.swift
//  adventureEngine
//
//  Created by Evan on 8/13/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

func run() throws {
    guard let fileData = NSData(contentsOfFile: "/Users/evan/Desktop/adventureEngine/story.json"),
    let result = try NSJSONSerialization.JSONObjectWithData(fileData, options: []) as? [String:[String:AnyObject]] else {
        return
    }
    var nextNode = 1;
    while nextNode != 0 {
        if let nodeData: [String:AnyObject] = result[String(nextNode)] {
            let node: Node = Node(data: nodeData)
            node.printStory()
            nextNode = node.read()
        } else {
            print("Node not found")
            return
        }
    }
}

try! run()