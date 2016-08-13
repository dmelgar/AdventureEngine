//
//  Node.swift
//  adventureEngine
//
//  Created by Evan on 8/13/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation

class Node: NSObject {
    var nodeData:[String:AnyObject]
    init(data:[String:AnyObject]) {
        nodeData = data
    }
    func printStory() {
        guard let storyArray = nodeData["story"] as? [String] else {
            return
        }
        for s in storyArray {
            print(s)
        }
    }
    func read() -> Int {
        guard let choices = nodeData["choices"] as? [String: Int] else {
            return 0
        }
        var nextNodeID: Int?
        while nextNodeID == nil {
            let input:String! = readLine(stripNewline: true)?.lowercaseString
            nextNodeID = choices[input]
            if nextNodeID == nil {
                print("The guards hate anything thats not", terminator:" ")
                for c in choices.keys.sort() {
                    print(c.uppercaseString, terminator: " ")
                }
            }
        }
        return nextNodeID!
    }
}
