//
//  SearchListViewModel.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation


final class SearchListViewModel {
    var repositories: [Repository] = []
    
    func getSearchList(searchText: String) {
        let repository = SearchListRepository()
        repository.getSearchList(searchText: searchText) { result in
            switch result {
            case .success(let value):
                self.repositories = value
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
