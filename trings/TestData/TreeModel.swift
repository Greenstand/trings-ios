//
//  TreeModel.swift
//  trings
//
//  Created by Robert Huber on 11/16/22.
//

import Foundation
import UIKit

struct Tree {
    let treeID: String
    let image_url: String
    let latitude: Double
    let longitude: Double
}
class TestTrees {
    static func getTestTrees(_ num: Int) -> [Tree] {
        var treesArray: [Tree] = []
        for _ in 0...num {
            let latitude = Double.random(in: -90...90)
            let longitude = Double.random(in: -180...180)
            let newTree = Tree(treeID: "156867", image_url: "tree3", latitude: latitude, longitude: longitude)
            treesArray.append(newTree)
        }
        return treesArray
    }
}
