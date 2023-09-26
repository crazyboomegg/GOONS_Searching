//
//  SearchTableViewCell.swift
//  GOONS_Searching
//
//  Created by 江柏毅 on 2023/9/25.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(repositories: Repository) {
        self.nameLabel.text = repositories.fullName
        self.contentLabel.text = repositories.content
        self.iconImage.kf.setImage(with: URL(string: repositories.owner.image!))
        
    }
    // MARK: - 生成UI的func
    
    private func addUI() {
        [nameLabel, contentLabel].forEach { (view) in
            stackView.addArrangedSubview(view)
        }
        [iconImage, stackView].forEach { (view) in
            baseView.addSubview(view)
        }
        
        contentView.addSubview(baseView)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(0)
            make.right.equalTo(contentView.snp.right).offset(0)
            make.top.equalTo(contentView.snp.top).offset(0)
            make.bottom.equalTo(contentView.snp.bottom).offset(0)
        }
        
        iconImage.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(0)
            make.centerY.equalTo(baseView)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.centerY.equalTo(iconImage)
            make.width.equalTo(100)
        }
        
    }
    
    private var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.text = "Repository name"
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "Repository nameRepository nameRepository name"
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
}
