//
//  SearchViewModel.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation

final class SearchData {
    var repository: Repository
    
    var fullName: String {
        return repository.fullName ?? ""
    }
    var content: String {
        return repository.content ?? ""
    }
    var image: String {
        return repository.owner.image ?? ""
    }
    var mainName: String {
        return repository.owner.mainName ?? ""
    }
    var language: String {
        return repository.language ?? ""
    }
    var stars: Int {
        return repository.stars ?? 0
    }
    var watcher: Int {
        return repository.watcher ?? 0
    }
    var fork: Int {
        return repository.fork ?? 0
    }
    var issue: Int {
        return repository.issue ?? 0
    }
    
    init(repository: Repository) {
        self.repository = repository
    }
}
