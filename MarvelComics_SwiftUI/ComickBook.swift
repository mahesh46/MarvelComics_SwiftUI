//
//  ComickBook.swift
//  MarvelComics_SwiftUI
//
//  Created by mahesh lad on 04/06/2023.
//

import Foundation


// MARK: - Welcome
struct MovieResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, digitalID: Int
    let title: String
//    let issueNumber: Int
//    let isbn, upc: String
//    let ean, issn: String
//    let format: Format
//    let pageCount: Int
//    let prices: [Price]
    let thumbnail: Thumbnail
//    let images: [Thumbnail]
//    let creators: Creators
//    let characters: Characters
//    let stories: Stories
//    let events: Characters

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title
        case thumbnail
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}


//// MARK: - Characters
//struct Characters: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [Series]
//    let returned: Int
//}
//
//// MARK: - Series
//struct Series: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//// MARK: - Creators
//struct Creators: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [CreatorsItem]
//    let returned: Int
//}
//

