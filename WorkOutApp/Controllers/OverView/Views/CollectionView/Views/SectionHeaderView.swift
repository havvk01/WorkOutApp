//
//  SectionHeaderView.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 25.03.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = R.Fonts.helveticaRegular(witch: 13)
        lable.textColor = R.Colors.inActive
        lable.textAlignment = .center
        return lable
    }()
    
    func configure(with title: String, andValue value: Int) {
        self.title.text = title
    }
}

private extension SectionHeaderView {
    func setupViews(){
        setupView(title)
    }
    
    func constaintViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureApperance() {
    }
}
