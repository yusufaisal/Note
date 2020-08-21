//
//  NoteRecord.swift
//  Note
//
//  Created by iSal on 21/08/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import Foundation

struct NoteRecord:Codable {
    var title:String
    var detail:String
    
    init(title:String, detail:String) {
        self.title = title
        self.detail = detail
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case detail = "detail"
    }
    
    func asDictionary() throws -> [String: Any] {
      let data = try JSONEncoder().encode(self)
      guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
        throw NSError()
      }
      return dictionary
    }
}
