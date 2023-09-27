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
    let fullName: String?
    let owner: Owner
    let content: String?
    let language: String?
    let stars: Int?
    let watcher: Int?
    let fork: Int?
    let issue: Int?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
        case content = "description"
        case language = "language"
        case stars = "stargazers_count"
        case watcher = "watchers_count"
        case fork = "forks_count"
        case issue = "open_issues_count"
    }
}

struct Owner: Decodable {
    let image: String?
    let mainName: String?

    enum CodingKeys: String, CodingKey {
        case image = "avatar_url"
        case mainName = "login"
    }
}
