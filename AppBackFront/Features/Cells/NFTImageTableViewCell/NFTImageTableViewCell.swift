//
//  NFTImageTableViewCell.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 01/10/23.
//

import UIKit
import AlamofireImage

class NFTImageTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: NFTImageTableViewCell.self)
    
    private lazy var screen: NFTImageTableViewCellScreen = {
        let view = NFTImageTableViewCellScreen()
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
    
    public func setupCell(urlImage: String, delegate: NFTImageTableViewCellScreenDelegate) {
        if let url: URL = URL(string: urlImage) {
            screen.nftImageView.af.setImage(withURL: url)
        }
        screen.delegate(delegate: delegate)
    }


}
