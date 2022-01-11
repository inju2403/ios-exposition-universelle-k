//
//  KoreanEntry.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/10.
//

struct KoreanEntry: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
