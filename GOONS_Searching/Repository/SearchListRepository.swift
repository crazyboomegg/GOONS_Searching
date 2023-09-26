//
//  SearchListRepository.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation

class SearchListRepository {
    let baseURL = "https://api.github.com/search/repositories?q="
    
    func getSearchList(searchText: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let urlString = baseURL + searchText
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if let error = error {
                print(error)
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsondata = try decoder.decode(SearchResult.self, from: data)
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
