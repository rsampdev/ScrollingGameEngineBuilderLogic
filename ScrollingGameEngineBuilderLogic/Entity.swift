//
//  Entity.swift
//  ScrollingGameEngineBuilderLogic
//
//  Created by Rodney Sampson on 9/22/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

import Foundation
import UIKit

class Entity : NSObject {
    
    var x: CGFloat?
    var y: CGFloat?
    var name: String?
    var location: CGPoint {
        return CGPoint.init(x: self.x!, y: self.y!)
    }
    
    init(x: CGFloat, y: CGFloat, name: String) {
        self.x = x
        self.y = y
        self.name = name
    }
    
    init(location: CGPoint, name: String) {
        self.x = location.x
        self.y = location.y
        self.name = name
    }
    
    func moveTo(newX: CGFloat, newY: CGFloat) {
        x = newX
        y = newY
    }
    
}
