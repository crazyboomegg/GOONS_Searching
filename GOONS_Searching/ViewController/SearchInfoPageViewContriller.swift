//
//  SearchInfoPageViewContriller.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

final class SearchInfoPageViewContriller: UIViewController {
    var repository: Repository
    
    init(repository: Repository) {
           self.repository = repository
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addUI()
        addConstrains()
        updateView()
    }
    
    private func updateView() {
        DispatchQueue.main.async { [self] in
            guard let searchName = self.repository.fullName else { return }
            self.mainTitle.text = repository.owner.mainName
            self.iconImage.kf.setImage(with: URL(string: repository.owner.image!))
            self.themeTitle.text = repository.fullName
            self.languageLabel.text = repository.language
            self.starsLabel.text = String(repository.stars!) + "stars"
            self.watcherLabel.text = String(repository.watcher!) + "watchers"
            self.forkLabel.text = String(repository.fork!) + "forks"
            self.issueLabel.text = String(repository.issue!) + "issues"
        }
    }
    
    private func addUI() {
        [starsLabel, watcherLabel, forkLabel, issueLabel].forEach { (view) in
            stackView.addArrangedSubview(view)
        }
        [mainTitle, iconImage, themeTitle, languageLabel, stackView].forEach { (view) in
            baseView.addSubview(view)
        }
        self.view.addSubview(baseView)
        
    }
    
    private func addConstrains() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(baseView.snp.left).offset(10)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(10)
            make.left.equalTo(mainTitle.snp.left).offset(0)
        }
        
        themeTitle.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(30)
            make.centerX.equalTo(baseView)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalTo(themeTitle.snp.bottom).offset(30)
            make.left.equalTo(iconImage.snp.left).offset(0)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(languageLabel.snp.top).offset(0)
            make.right.equalTo(iconImage.snp.right).offset(0)
        }
        
    }
   
    private var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.black
        label.text = "Repository Search"
        return label
    }()
    
    private var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var themeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "Repository Search"
        return label
    }()
    
    private var languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "Program language"
        return label
    }()
    
    private var starsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "starsLabel"
        return label
    }()
    
    private var watcherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "watcherLabel"
        return label
    }()
    
    private var forkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "forkLabel"
        return label
    }()
    
    private var issueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "issueLabel"
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()
    
}
