//
//  SearchListViewModel.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation
import UIKit

final class SearchListViewModel {
    var searchList: [Repository] = []
    let refreshControl = UIRefreshControl()
    
    func getSearchList(searchText: String, completion: @escaping () -> Void) {
        let repository = SearchListRepository()
        repository.getSearchList(searchText: searchText) { result in
            switch result {
            case .success(let value):
                self.searchList = value
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
    
    func clearSearchList() {
        searchList.removeAll()
    }
}
