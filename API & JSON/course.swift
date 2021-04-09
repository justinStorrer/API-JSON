//
//  course.swift
//  API & JSON
//
//  Created by Justin Storrer on 4/9/21.
//

import Foundation

class Course: Codable {
    var title = ""
    var subtitle = ""
    var imageURL = ""
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imageURL = "image"
    }
}
