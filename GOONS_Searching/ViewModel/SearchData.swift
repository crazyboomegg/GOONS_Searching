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
    
    init(repository: Repository) {
        self.repository = repository
    }
}
