//
//  NFTImageTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 01/10/23.
//

import UIKit

protocol NFTImageTableViewCellScreenDelegate: AnyObject {
    func tappedClosedButton()
    func tappedMagnifyGlassButton()
}

class NFTImageTableViewCellScreen: UIView {
    
    private weak var delegate: NFTImageTableViewCellScreenDelegate?
    
    public func delegate(delegate: NFTImageTableViewCellScreenDelegate?) {
        self.delegate = delegate
    }
    
    
    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1)
        return image
    }()
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedClosedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedClosedButton() {
        delegate?.tappedClosedButton()
    }
    
    lazy var magnifyGlassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(tappedMagnifyGlassButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMagnifyGlassButton() {
        delegate?.tappedMagnifyGlassButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configContraints()
    }
    
    private func addViews() {
        addSubview(nftImageView)
        addSubview(closedButton)
        addSubview(magnifyGlassButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closedButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closedButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 35),
            closedButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyGlassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            magnifyGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyGlassButton.widthAnchor.constraint(equalToConstant: 35),
            
        ])
    }
    
}
