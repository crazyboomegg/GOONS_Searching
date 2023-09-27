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
       // self.navigationItem.titleView = themeTitle
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
        guard let searchText = searchBar.text, !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            showAlert()
            endRefreshingWithDelay()
            return
        }
        fetchDataOrPerformTask(with: searchText)
    }
    func endRefreshingWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
        }
    }

    func fetchDataOrPerformTask(with searchText: String) {
        viewModel.getSearchList(searchText: searchText){
           DispatchQueue.main.async {
             self.refreshControl.endRefreshing()
          }
        }
    }
    
    func showAlert() {
            let alert = UIAlertController(title: "Oops!", message: "The data couldn't be read because it is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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

       // tableView.addSubview(searchBar)
        baseView.addSubview(tableView)
        self.view.addSubview(baseView)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
//        searchBar.snp.makeConstraints { make in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
//            make.left.equalTo(baseView.snp.left).offset(10)
//            make.right.equalTo(baseView.snp.right).offset(-10)
//        }
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(baseView.snp.left).offset(10)
            make.right.equalTo(baseView.snp.right).offset(-10)
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
        switch section {
            case 0, 1:
                return 0
            case 2:
                return viewModel.searchList.count
            default:
                return 0
            }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
//        cell.bind(repositories: viewModel.searchList[indexPath.row])
//        return cell
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            
            cell.bind(repositories: viewModel.searchList[indexPath.row])
            
            return cell
         }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViewModel = viewModel.searchList[indexPath.row]
        let viewController = SearchInfoPageViewContriller(repository: selectedViewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
           case 0:
               return 40.0
           case 1:
               return 60.0
           default:
               return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
           case 0:
               return themeTitle
           case 1:
            searchBar.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44.0)
               return searchBar
           default:
               return nil
           }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.estimatedRowHeight
    }
}


