//
//  NFTDescriptionTableViewCell.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 01/10/23.
//

import UIKit

class NFTDescriptionTableViewCell: UITableViewCell {

    static let identifier = String(describing: NFTDescriptionTableViewCell.self)
    
    private lazy var screen: NFTDescriptionTableViewCellScreen = {
        let view = NFTDescriptionTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        configConstraints()
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(id: Int, title: String, description: String) {
        screen.idLabel.text = "#\(id)"
        screen.titleLabel.text = title
        screen.descriptionLabel.text = description
    }

}
