//
//  ViewController.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/24.
//

import UIKit
import SnapKit

class SearchListViewController: UIViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addUI()
        addConstraints()
        self.navigationItem.titleView = themeTitle
    }
    
    
    func setView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    // MARK: - 生成UI的func
    private func addUI() {

        baseView.addSubview(searchBar)
        self.view.addSubview(baseView)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(baseView.snp.left).offset(10)
            make.right.equalTo(baseView.snp.right).offset(-10)
        }
    }
    
    private var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var themeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = UIColor.black
        label.text = "Repository Search"
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.placeholder = "請輸入關鍵字搜查"
            return searchBar
        }()
    
}


extension SearchListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}


