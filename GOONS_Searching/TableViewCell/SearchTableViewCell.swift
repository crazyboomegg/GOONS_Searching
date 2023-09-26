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
