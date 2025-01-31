//
//  CategoryCell.swift
//  MachineTest
//
//  Created by Fauzi Arda on 31/01/25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCellItem"
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configureWith(cat title: String) {
        button.setTitle(title, for: .normal)
    }
}
