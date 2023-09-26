//
//  ViewController.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/24.
//

import UIKit
import SnapKit

class SearchListViewController: UIViewController, UISearchBarDelegate {
    var viewModel = SearchListViewModel()
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addUI()
        addConstraints()
        setView()
        self.navigationItem.titleView = themeTitle
        searchBar.delegate = self
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            viewModel.getSearchList(searchText: searchText) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } else {
            viewModel.clearSearchList()
            tableView.reloadData()
        }
    }
    
    @objc func handleRefresh() {
        self.refreshControl.endRefreshing()
    }
    
    func setView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.separatorStyle = .singleLine
        tableView.refreshControl = refreshControl
        tableView.estimatedRowHeight = 120
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        if tableView.contentSize.height != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.cellForRow(at: indexPath)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    // MARK: - 生成UI的func
    private func addUI() {

        baseView.addSubview(searchBar)
        baseView.addSubview(tableView)
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
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(0)
            make.left.equalTo(baseView.snp.left).offset(0)
            make.right.equalTo(baseView.snp.right).offset(0)
            make.bottom.equalTo(baseView.snp.bottom).offset(0)
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
        return viewModel.searchList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.bind(repositories: viewModel.searchList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.estimatedRowHeight
    }
}


