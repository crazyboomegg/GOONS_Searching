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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 生成UI的func
    
    private func addUI() {
        
    }
    
    private func addConstraints() {
        
    }
    
    private var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    
}
