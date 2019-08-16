//
//  Game+CoreDataProperties.swift
//  BRGamebookEngine
//
//  Created by Bradley Root on 8/29/19.
//  Copyright © 2019 Brad Root. All rights reserved.
//
//

import CoreData
import Foundation

@objc public enum GameFont: Int32, CustomStringConvertible {
    case normal = 0
    case sansSerif = 1
    case serif = 2

    public var description: String {
        switch self {
        case .normal: return "Normal"
        case .sansSerif: return "Sans Serif"
        case .serif: return "Serif"
        }
    }

    public var jsonDescription: String {
        switch self {
        case .normal: return "normal"
        case .sansSerif: return "sans_serif"
        case .serif: return "serif"
        }
    }

    init?(jsonDescription: String) {
        switch jsonDescription {
        case "normal":
            self.init(rawValue: 0)
        case "sans_serif":
            self.init(rawValue: 1)
        case "serif":
            self.init(rawValue: 2)
        default:
            self.init(rawValue: 0)
        }
    }
}

extension Game {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var name: String
    @NSManaged public var uuid: UUID
    @NSManaged public var author: String
    @NSManaged public var license: String?
    @NSManaged public var website: URL?
    @NSManaged public var about: String?
    @NSManaged public var font: GameFont
    @NSManaged public var attributes: NSSet?
    @NSManaged public var pages: NSOrderedSet?
}

// MARK: Gamebook Engine Methods

extension Game {
    func createAttribute(_ name: String, completion: @escaping (Attribute?) -> Void) {
        GameDatabase.standard.createAttribute(for: self, name: name) { attribute in
            completion(attribute)
        }
    }
}

// MARK: Generated accessors for attributes

extension Game {
    @objc(addAttributesObject:)
    @NSManaged public func addToAttributes(_ value: Attribute)

    @objc(removeAttributesObject:)
    @NSManaged public func removeFromAttributes(_ value: Attribute)

    @objc(addAttributes:)
    @NSManaged public func addToAttributes(_ values: NSSet)

    @objc(removeAttributes:)
    @NSManaged public func removeFromAttributes(_ values: NSSet)
}

// MARK: Generated accessors for pages

extension Game {
    @objc(insertObject:inPagesAtIndex:)
    @NSManaged public func insertIntoPages(_ value: Page, at idx: Int)

    @objc(removeObjectFromPagesAtIndex:)
    @NSManaged public func removeFromPages(at idx: Int)

    @objc(insertPages:atIndexes:)
    @NSManaged public func insertIntoPages(_ values: [Page], at indexes: NSIndexSet)

    @objc(removePagesAtIndexes:)
    @NSManaged public func removeFromPages(at indexes: NSIndexSet)

    @objc(replaceObjectInPagesAtIndex:withObject:)
    @NSManaged public func replacePages(at idx: Int, with value: Page)

    @objc(replacePagesAtIndexes:withPages:)
    @NSManaged public func replacePages(at indexes: NSIndexSet, with values: [Page])

    @objc(addPagesObject:)
    @NSManaged public func addToPages(_ value: Page)

    @objc(removePagesObject:)
    @NSManaged public func removeFromPages(_ value: Page)

    @objc(addPages:)
    @NSManaged public func addToPages(_ values: NSOrderedSet)

    @objc(removePages:)
    @NSManaged public func removeFromPages(_ values: NSOrderedSet)
}
