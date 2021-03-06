//
//  Page.swift
//  Amtrip
//
//  Created by Kenta Kodashima on 2018-04-14.
//  Copyright © 2018 Kenta Kodashima. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

@objcMembers class Page: Object {
  
  enum Property: String {
    case key, albumTitle, pageTitle, date, location, bodyText, images
  }

  @objc dynamic private(set) var key = UUID().uuidString
  @objc dynamic public var albumTitle: String = ""
  @objc dynamic public var pageTitle: String = ""
  @objc dynamic public var date: Date = Date()
  @objc dynamic public var location: String = ""
  @objc dynamic public var bodyText: String = ""
  @objc dynamic public var whatAlbumToBelong: String = ""
  @objc dynamic public var isFavorite: Bool = false
  var images = List<String>()

  override static func primaryKey() -> String? {
    return Page.Property.key.rawValue
  }

  convenience init(
    albumTitle: String,
    pageTitle: String,
    date: Date,
    location: String,
    bodyText: String
    ) {
    self.init()
    self.albumTitle = albumTitle
    self.pageTitle = pageTitle
    self.date = date
    self.location = location
    self.bodyText = bodyText
  }
}

extension Page {
  
  static func all(in realm: Realm = try! Realm()) -> Results<Page> {
    return realm.objects(Page.self).sorted(byKeyPath: Page.Property.date.rawValue)
  }
  
  static func pagesInAlbum(albumTitle: String, in realm: Realm = try! Realm()) -> Results<Page> {
    return realm.objects(Page.self).filter("albumTitle == '\(albumTitle)'")
  }
  
  static func favoritePages(in realm: Realm = try! Realm()) -> Results<Page> {
    
    return realm.objects(Page.self).filter("isFavorite == true")
  }
  
}
