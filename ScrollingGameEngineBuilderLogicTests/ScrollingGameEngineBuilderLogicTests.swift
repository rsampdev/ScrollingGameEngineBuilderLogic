//
//  ScrollingGameEngineBuilderLogicTests.swift
//  ScrollingGameEngineBuilderLogicTests
//
//  Created by Rodney Sampson on 9/22/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

import XCTest
@testable import ScrollingGameEngineBuilderLogic

class ScrollingGameEngineBuilderLogicTests: XCTestCase {
    
    func testEntityNaming() {
        let player = Entity(x: 0, y: 0, name: "Steve")
        XCTAssert(player.name == "Steve")
    }
    
    func testEntityMovement() {
        let player = Entity(x: 0, y: 0, name: "Steve")
        XCTAssert(player.x == 0)
        XCTAssert(player.y == 0)
        player.moveTo(newX: 64, newY: 64)
        XCTAssert(player.x == 64)
        XCTAssert(player.y == 64)
    }
    
    func testEntityLocation() {
        let player = Entity(location: CGPoint.init(x: 0, y: 0), name: "Steve")
        XCTAssert(player.location == CGPoint.init(x: 0, y: 0))
        player.moveTo(newX: 64, newY: 64)
        XCTAssert(player.location == CGPoint.init(x: 64, y: 64))
    }
    
    func testLevelInitializedWithEntity() {
        let entity = Entity(x: 0, y: 0, name: "Steve")
        let level = Level(entity: entity)
        XCTAssert(level.entities.count == 1)
    }
    
    func testLevelAddingEntites() {
        let entity = Entity(x: 0, y: 0, name: "Steve")
        let level = Level()
        XCTAssert(level.entities.count == 0)
        level.addEntity(entity)
        XCTAssert(level.entities.count == 1)
    }
    
    func testLevelRemovingEntites() {
        let entity = Entity(x: 0, y: 0, name: "Steve")
        let level = Level(entity: entity)
        XCTAssert(level.entities.count == 1)
        level.removeEntity(entity)
        XCTAssert(level.entities.count == 0)
    }
    
    func testLevelInsertingEntites() {
        let entityOne = Entity(x: 0, y: 0, name: "Steve")
        let entityTwo = Entity(x: 0, y: 0, name: "Alex")
        let level = Level(entity: entityOne)
        XCTAssert(level.entities.first == entityOne)
        level.insertEntity(entityTwo, atIndex: 0)
        XCTAssert(level.entities.first == entityTwo)
    }
    
    func testGameInitializedWithEntityAndLevel() {
        let entity = Entity(x: 0, y: 0, name: "entity")
        let level = Level(entity: entity)
        let game = Game(mainEntity: entity, level: level)
        XCTAssert(game.mainEntity?.name == "entity")
        XCTAssert(game.mainEntity == level.entities.first)
        XCTAssert(game.currentLevel!.entities.contains(game.mainEntity!))
    }
    
    func testGameInitializedWithEntityAndLevels() {
        let entity = Entity(x: 0, y: 0, name: "entity")
        let levelOne = Level(entity: entity)
        let levels = [levelOne, Level(), Level()]
        let game = Game(mainEntity: entity, level: levelOne, levels: levels)
        XCTAssert(game.mainEntity?.name == "entity")
        XCTAssert(game.mainEntity == levelOne.entities.first)
        XCTAssert(game.currentLevel!.entities.contains(game.mainEntity!))
    }
    
    func testGameChangeLevels() {
        let entityOne = Entity(x: 0, y: 0, name: "Steve")
        let entityTwo = Entity(x: 0, y: 0, name: "Alex")
        let levelOne = Level(entity: entityOne)
        let levelTwo = Level(entity: entityTwo)
        let game = Game(mainEntity: levelOne.entities.first!, level: levelOne)
        XCTAssert(game.currentLevel == levelOne)
        game.changeLevel(levelTwo)
        XCTAssert(game.currentLevel == levelTwo)
    }
    
    func testGameAddLevels() {
        let entityOne = Entity(x: 0, y: 0, name: "Steve")
        let entityTwo = Entity(x: 0, y: 0, name: "Alex")
        let levelOne = Level(entity: entityOne)
        let levelTwo = Level(entity: entityTwo)
        let game = Game(mainEntity: levelOne.entities.first!, level: levelOne)
        XCTAssert(game.levels?.count == 1)
        game.addLevel(levelTwo)
        XCTAssert(game.levels?.count == 2)
    }
    
    func testGameChangeMainEntity() {
        let entityOne = Entity(x: 0, y: 0, name: "Steve")
        let entityTwo = Entity(x: 0, y: 0, name: "Alex")
        let levelOne = Level(entity: entityOne)
        let game = Game(mainEntity: levelOne.entities.first!, level: levelOne)
        XCTAssert(game.mainEntity == entityOne)
        game.changeMainEntity(entityTwo)
        XCTAssert(game.mainEntity == entityTwo)
    }
    
}
