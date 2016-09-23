//
//  Level.swift
//  ScrollingGameEngineBuilderLogic
//
//  Created by Rodney Sampson on 9/22/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

import Foundation

class Level: NSObject {
    
    var entities = [Entity]()
    
    override init() {
        super.init()
    }
    
    init(entity: Entity) {
        super.init()
        insertEntity(entity, atIndex: 0)
    }
    
    func addEntity(_ newEntity: Entity) {
        entities.append(newEntity)
    }
    
    func removeEntity(_ entity: Entity) {
        entities.remove(at: entities.index(of: entity)!)
    }
    
    func insertEntity(_ entity: Entity, atIndex index: Int) {
        entities.insert(entity, at: index)
    }
    
}
