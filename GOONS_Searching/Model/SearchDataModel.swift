//
//  SearchDataModel.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/26.
//

import Foundation

struct SearchResult: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Repository: Decodable {
    let fullName: String
    let owner: Owner
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
        case content = "description"
    }
}

struct Owner: Decodable {
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
