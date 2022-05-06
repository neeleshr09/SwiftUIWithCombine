//
//  Photo.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import Foundation


struct Photo: Decodable {
    let id: Int
    let name: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}
