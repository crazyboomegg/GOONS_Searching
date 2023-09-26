//
//  SearchInfoPageViewContriller.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/27.
//

import Foundation
import UIKit
import Kingfisher

final class SearchInfoPageViewContriller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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
